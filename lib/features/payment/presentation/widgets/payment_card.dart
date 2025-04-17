import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/payment/data/model/payment_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PaymentCard extends StatelessWidget {
  final PaymentOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 2.5,
                color: isSelected ? ColorManager.primary700 : Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 2,
          margin:  EdgeInsets.symmetric(vertical: 8.h),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.h),
            child: Row(
              children: [
                Image.asset(option.imagePath,height: 80.h,width: 80.h,),
                const Spacer(),
                Text(option.title,style: getMediumStyle(color: ColorManager.black500),),
                SizedBox(width: 10.w,),
                Image.asset(
                  isSelected ?IconsAssets.checkSolid : IconsAssets.check,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}