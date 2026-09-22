import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movieapp/features/forget_password_screen.dart';
import 'package:movieapp/features/home/home_screen.dart';
import 'package:movieapp/features/login_screen.dart';
import 'package:movieapp/features/register.dart';
import 'package:movieapp/firebase_options.dart';

import 'features/onboarding/introduction_screen.dart';
import 'features/onboarding/onboarding_five.dart';
import 'features/onboarding/onboarding_four.dart';
import 'features/onboarding/onboarding_one.dart';
import 'features/onboarding/onboarding_three.dart';
import 'features/onboarding/onboarding_two.dart';
import 'features/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
    serverClientId:
        '240953421387-h0eie8pte7qtq7uk7rd1pcthb7uh26pi.apps.googleusercontent.com',
  );
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Movie-App',
      initialRoute: SplashScreen.routeName,
      routes: {
        '/login': (context) => LoginScreen(),
        '/forget_password': (context) => ForgetPasswordScreen(),
        '/register': (context) => RegisterScreen(),
        'homescreen': (context) => HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        IntroductionScreen.routeName: (context) => const IntroductionScreen(),
        OnboardingOne.routeName: (context) => const OnboardingOne(),
        OnboardingTwo.routeName: (context) => const OnboardingTwo(),
        OnboardingThree.routeName: (context) => const OnboardingThree(),
        OnboardingFour.routeName: (context) => const OnboardingFour(),
        OnboardingFive.routeName: (context) => const OnboardingFive(),
      },
    );
  }
}
