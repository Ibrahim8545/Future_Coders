import 'package:shared_preferences/shared_preferences.dart';

class LocalPayment {
  static Future<void> savePaymentAsList({
    required String name,
    required String date,
    required String time,
    required double amount,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final payments = prefs.getStringList('all_payments') ?? [];

    final newPayment = {
      'name': name,
      'date': date,
      'time': time,
      'amount': amount.toString(),
    };

    payments.add(newPayment.toString());

    await prefs.setStringList('all_payments', payments);
  }
}