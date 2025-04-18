import 'package:courseapp/core/utils/api_keys.dart';
import 'package:courseapp/core/utils/api_service.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/features/payment/data/model/ephemeral_key_model.dart';
import 'package:courseapp/features/payment/data/model/init_payment_sheet_input_model.dart';
import 'package:courseapp/features/payment/data/model/payment_intent_%20model.dart';
import 'package:courseapp/features/payment/data/model/payment_intent_input_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  // 1- paymentIntentObject create paymentIntent (amount , currency , customerId)
  // 2- keySecret create EphemeralKey(StripeVersion,customerId)
  // 3- init payment sheet (paymentIntentClientSecret,merchant,ephemeralKey)
  // 4- present for payment sheet to show payment sheet

  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: ApiKeys.url,
        token: ApiKeys.secretKey);
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: "mohammed",
        appearance: PaymentSheetAppearance(
          colors: PaymentSheetAppearanceColors(
            primaryText: ColorManager.primary700,
            secondaryText: ColorManager.white,
          ),
          primaryButton: PaymentSheetPrimaryButtonAppearance(
            colors: PaymentSheetPrimaryButtonTheme(
              light: PaymentSheetPrimaryButtonThemeColors(
                background: ColorManager.primary700,
                text: ColorManager.white,
              )
            )
          ),
        )
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralKeyModel.secret ?? "");
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        body: {
          "customer": customerId,
        },
        contentType: Headers.formUrlEncodedContentType,
        url: ApiKeys.ephemeralUrl,
        headers: {
          "Authorization": "Bearer ${ApiKeys.secretKey}",
          "Stripe-Version": "2025-01-27.acacia",
        },
        token: ApiKeys.secretKey);
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
