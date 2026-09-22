import 'package:flutter/material.dart';
import '../../core/theme/app_assets.dart';
import '../../core/theme/app_strings.dart';
import 'onboarding_two.dart';
import 'widgets/onboarding_body.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});
  static const String routeName = 'Onboarding-One';

  @override
  Widget build(BuildContext context) {
    return OnboardingBody(
      image: AppAssets.captainAmerica,

      title: AppStrings.title,
      description: AppStrings.explore,


      nextButtonText: 'Next',
      glowColor: Colors.cyan,
      onNext: () {
        Navigator.of(context).pushNamed(OnboardingTwo.routeName);
      },
    );
  }
}
