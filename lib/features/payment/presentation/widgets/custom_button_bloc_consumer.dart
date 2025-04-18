import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/payment/data/model/payment_intent_input_model.dart';
import 'package:courseapp/features/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:courseapp/features/payment/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(
            builder: (context) => const ThankYouView(),
          ));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop(context);
          SnackBar snackBar = const SnackBar(
              content: Text("Payment process not completed"));
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel
            paymentIntentInputModel =
            PaymentIntentInputModel(
                amount: "250",
                currency: "USD",
                customerId: 'cus_RwFn9yDZnuvOJH');
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(
                paymentIntentInputModel:
                paymentIntentInputModel);
            // if ((formKey.currentState as FormState)
            //     .validate()) {
            //
            // } else {
            //   debugPrint("Form not valid. Show errors.");
            // }
          },
          text: "ادفع",
          color: ColorManager.primary700,
        );
      },
    );
  }
}
