import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/firebase_function.dart';
import 'package:movies/core/validators.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/features/login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = '/forget_password';
  ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var email = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          'Forget Passowrd',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/image/Forgot password.png'),
            SizedBox(height: 15),
            CustomTextFormField(
              hintText: 'Email',
              controller: email,
              prefixIcon: Image.asset('assets/image/email.png'),
              keyboardType: TextInputType.emailAddress,
              validator: Validators.email,
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
              text: "Verify Email",
              textStyle: TextStyle(color: Colors.black, fontSize: 20),
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                final error = await FirebaseFunction.resetPassword(email.text);

                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      error ??
                          'Reset link sent, check your email (and spam folder)',
                    ),
                  ),
                );
                if (error == null) Navigator.pop(context);
              },
              backgroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
