import 'package:bloc/bloc.dart';
import 'package:courseapp/features/payment/data/model/payment_intent_input_model.dart';
import 'package:courseapp/features/payment/data/repos/checkout_repo.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (l) => emit(PaymentFailure(l.errorMessage)),
      (r) => emit(PaymentSuccess()),
    );
  }
}
