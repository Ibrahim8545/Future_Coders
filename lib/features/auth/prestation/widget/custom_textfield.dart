import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hint,
      this.maxLines = 1,
      this.hintText,
      this.text,
      this.obscureText = false,
      this.controller,
      this.keyboardType,
      this.suffixIcon,
      this.validator,
      this.prefixIcon});

  String? hint;
  String? hintText;
  String? text;
  bool? obscureText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  int? maxLines;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      maxLines: maxLines,
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        errorStyle: getMediumStyle(color: ColorManager.red600,fontSize: 12.sp),
        hintTextDirection: TextDirection.rtl,
        hintText: hintText,
        hintStyle: getMediumStyle(color: ColorManager.grey1, fontSize: 16.sp),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: Align(
          alignment: Alignment.centerRight,
          child: Text(
            '$hint',
            style:
                getMediumStyle(color: ColorManager.black500, fontSize: 14.sp),
          ),
        ),
        labelStyle: const TextStyle(color: Color(0xff999999), fontSize: 16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary700,
            width: 2
          )
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xff0A638F),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xff0A638F),
          ),
        ),
      ),
      style: getMediumStyle(
        color: ColorManager.black500,
        fontSize: 16.sp,
      ),
    );
  }
}
