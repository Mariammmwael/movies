import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/validators.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/core/widgets/flag_button.dart';
import 'package:movies/features/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var name = TextEditingController();
  var password = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var repassword = TextEditingController();
  String selectedLang = 'en';

  final List<String> images = [
    'assets/image/user1.png',
    'assets/image/user2.png',
    'assets/image/user3.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          'Register',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CarouselSlider.builder(
                  itemCount: images.length,

                  itemBuilder: (context, index, realIndex) {
                    final isSelected = currentIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 5),

                        padding: const EdgeInsets.all(4),

                        child: ClipOval(
                          child: Image.asset(images[index], fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 130,
                    viewportFraction: 0.50,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    'Avatar',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight(400),
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Name',
                  controller: name,
                  prefixIcon: Image.asset('assets/image/icon_name.png'),
                  keyboardType: TextInputType.name,
                  validator: Validators.name,
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: email,
                  prefixIcon: Image.asset('assets/image/email.png'),
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: email,
                  prefixIcon: Image.asset('assets/image/email.png'),
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Password',
                  isPassword: true,
                  controller: password,
                  prefixIcon: Image.asset('assets/image/password.png'),
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validators.password,
                  suffixIcon: Image.asset('assets/image/Group.png'),
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Confirm Password',
                  isPassword: true,
                  controller: password,
                  prefixIcon: Image.asset('assets/image/password.png'),
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validators.newPassword,
                  suffixIcon: Image.asset('assets/image/Group.png'),
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Phone',
                  controller: phone,
                  prefixIcon: Image.asset('assets/image/phone.png'),
                  keyboardType: TextInputType.phone,
                  validator: Validators.phoneValidator,
                ),
                SizedBox(height: 15),
                CustomElevatedButton(
                  text: "Create Account",
                  textStyle: TextStyle(color: Colors.black, fontSize: 20),
                  onPressed: () {},
                  backgroundColor: AppColors.primaryColor,
                ),
                SizedBox(height: 15),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already Have Account ? ",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildFlagButton(
                          'assets/image/LR.png',
                          isSelected: selectedLang == 'en',
                          onTap: () {
                            setState(() {
                              selectedLang = 'en';
                            });
                            context.setLocale(const Locale('en'));
                          },
                          setLocale: const Locale('en'),
                        ),
                        const SizedBox(width: 6),
                        buildFlagButton(
                          'assets/image/EG.png',
                          isSelected: selectedLang == 'ar',
                          onTap: () {
                            setState(() {
                              selectedLang = 'ar';
                            });
                            context.setLocale(const Locale('ar'));
                          },
                          setLocale: const Locale('ar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
