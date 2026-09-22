import 'package:flutter/material.dart';

import 'features/onboarding/introduction_screen.dart';
import 'features/onboarding/onboarding_five.dart';
import 'features/onboarding/onboarding_four.dart';
import 'features/onboarding/onboarding_one.dart';
import 'features/onboarding/onboarding_three.dart';
import 'features/onboarding/onboarding_two.dart';
import 'features/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie-App',
      initialRoute: SplashScreen.routeName,
      routes: {
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
