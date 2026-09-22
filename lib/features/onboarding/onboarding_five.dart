import 'package:flutter/material.dart';
import '../../core/theme/app_assets.dart';
import '../../core/theme/app_strings.dart';
import 'widgets/onboarding_body.dart';

class OnboardingFive extends StatelessWidget {
  const OnboardingFive({super.key});
  static const String routeName = 'Onboarding-Five';

  @override
  Widget build(BuildContext context) {
    return OnboardingBody(
      image: AppAssets.blackMovie, // Placeholder for 1917 image
      title: AppStrings.watchNow,
      nextButtonText: 'Finish',
      glowColor: Colors.grey,
      onNext: () {
        // Finish onboarding, e.g., go to Home or Login
      },
      onBack: () {
        Navigator.of(context).pop();
      },
    );
  }
}
