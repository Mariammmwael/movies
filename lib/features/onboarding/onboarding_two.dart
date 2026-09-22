import 'package:flutter/material.dart';
import '../../core/theme/app_assets.dart';
import '../../core/theme/app_strings.dart';
import 'onboarding_three.dart';
import 'widgets/onboarding_body.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});
  static const String routeName = 'Onboarding-Two';

  @override
  Widget build(BuildContext context) {
    return OnboardingBody(
      image: AppAssets.theGodfather, // Corrected from blackMovie
      title: AppStrings.exploreAllGenres,
      description: AppStrings.description,
      nextButtonText: 'Next',
      glowColor: Colors.orange,
      onNext: () {
        Navigator.of(context).pushNamed(OnboardingThree.routeName);
      },
      onBack: () {
        Navigator.of(context).pop();
      },
    );
  }
}
