import 'package:courseapp/core/errors/failures.dart';
import 'package:courseapp/core/utils/stripe_service.dart';
import 'package:courseapp/features/payment/data/model/payment_intent_input_model.dart';
import 'package:courseapp/features/payment/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try{ await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    }
    catch(e){
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
