import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hint,
      this.text,
      this.obscureText = false,
      this.controller,
      this.keyboardType});

  String? hint;
  String? text;
  bool? obscureText;
  TextEditingController? controller;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) {
          return (text);
        }
      },
      decoration: InputDecoration(
        label: Align(
          alignment: Alignment.centerRight,
          child: Text('$hint'),
        ),
        labelStyle: const TextStyle(color: Color(0xff999999), fontSize: 16.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.blue,
      ),
    );
  }
}
