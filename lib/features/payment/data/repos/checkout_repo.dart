import 'package:courseapp/core/errors/failures.dart';
import 'package:courseapp/features/payment/data/model/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}

