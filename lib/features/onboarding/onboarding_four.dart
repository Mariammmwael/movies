import 'package:flutter/material.dart';
import '../../core/theme/app_assets.dart';
import '../../core/theme/app_strings.dart';
import 'onboarding_five.dart';
import 'widgets/onboarding_body.dart';

class OnboardingFour extends StatelessWidget {
  const OnboardingFour({super.key});
  static const String routeName = 'Onboarding-Four';

  @override
  Widget build(BuildContext context) {
    return OnboardingBody(
      image: AppAssets.rate, // Updated from placeholder
      title: AppStrings.rating,
      description: AppStrings.rateDescription,
      nextButtonText: 'Next',
      glowColor: Colors.red,
      onNext: () {
        Navigator.of(context).pushNamed(OnboardingFive.routeName);
      },
      onBack: () {
        Navigator.of(context).pop();
      },
    );
  }
}
