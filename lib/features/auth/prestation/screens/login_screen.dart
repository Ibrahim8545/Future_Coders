import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'LoginPage';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Get current theme
    return Scaffold(
      // Use theme color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(height: 75),
              Image.asset(
                'assets/images/siginin_logo.png',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                hint: 'تدخل بريدك الالكتروني',
                text: 'Email must be not empty',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                hint: 'Password',
                text: 'Password must be not empty',
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
                text: 'Login',
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'don\'t have an account ?',
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Register',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
