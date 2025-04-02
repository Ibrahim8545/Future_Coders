import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hint,
      this.maxLines = 1,
      this.text,
      this.obscureText = false,
      this.controller,
      this.keyboardType,
      this.suffixIcon,
      this.prefixIcon});

  String? hint;
  String? text;
  bool? obscureText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  int? maxLines;
  Widget? suffixIcon;
  Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) {
          return (text);
        }
      },
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: Align(
          alignment: Alignment.centerRight,
          child: Text('$hint'),
        ),
        labelStyle: const TextStyle(color: Color(0xff999999), fontSize: 16.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff0A638F),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff0A638F),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff0A638F),
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.blue,
      ),
    );
  }
}
