import 'package:flutter/material.dart';
import '../../core/theme/app_assets.dart';
import '../../core/theme/app_strings.dart';
import 'onboarding_four.dart';
import 'widgets/onboarding_body.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});
  static const String routeName = 'Onboarding-Three';

  @override
  Widget build(BuildContext context) {
    return OnboardingBody(
      image: AppAssets.badboys,
      title: AppStrings.createWatchlists,
      description: AppStrings.listDescription,
      nextButtonText: 'Next',
      glowColor: Colors.deepPurple,
      onNext: () {
        Navigator.of(context).pushNamed(OnboardingFour.routeName);
      },
      onBack: () {
        Navigator.of(context).pop();
      },
    );
  }
}
