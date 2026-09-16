import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/validators.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/core/widgets/or_divider.dart';
import 'package:movies/features/forget_password_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  LoginScreen({super.key});

  var username = TextEditingController();
  var password = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/logo.png',
                        height: 200,
                        width: 200,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    controller: username,
                    hintText: "Email",
                    prefixIcon: Image.asset("assets/image/email.png"),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    controller: password,
                    isPassword: true,
                    hintText: "Password",
                    prefixIcon: Image.asset("assets/image/password.png"),
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validators.password,
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ForgetPasswordScreen.routeName,
                      );
                    },
                    child: Text(
                      "Forget Password?",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomElevatedButton(
                    text: "Login",
                    textStyle: TextStyle(color: Colors.black, fontSize: 20),
                    onPressed: () {},
                    backgroundColor: AppColors.primaryColor,
                  ),
                  SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Create One",
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  OrDivider(),
                  SizedBox(height: 20),
                  CustomElevatedButton(
                    icon: Image.asset('assets/image/icon _google.png'),
                    text: "Login With Google",
                    textStyle: TextStyle(color: Colors.black, fontSize: 16),
                    onPressed: () {},
                    backgroundColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
