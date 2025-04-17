
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class PaymentData extends StatelessWidget {
  const PaymentData({super.key, required this.paymentData, required this.size});

  final String paymentData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              paymentData,
              style: getMediumStyle(
                fontSize: size,
                color: ColorManager.black500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}