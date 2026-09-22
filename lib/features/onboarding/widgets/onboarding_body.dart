import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class OnboardingBody extends StatelessWidget {
  final String image;
  final String title;
  final String? description;
  final String nextButtonText;
  final VoidCallback onNext;
  final VoidCallback? onBack;
  final Color glowColor;

  final double imageHeightFactor;
  final double titleFontSize;
  final double descriptionFontSize;

  const OnboardingBody({
    super.key,
    required this.image,
    required this.title,
    this.description,
    required this.nextButtonText,
    required this.onNext,
    this.onBack,
    required this.glowColor,
    this.imageHeightFactor = 1.0,
    this.titleFontSize = 24,
    this.descriptionFontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.7, -0.2),
                  radius: 1.2,
                  colors: [
                    glowColor.withOpacity(0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                    AppColors.black.withOpacity(0.6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      description!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: descriptionFontSize,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                  ],
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,
                      foregroundColor: AppColors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      nextButtonText,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (onBack != null) ...[
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: onBack,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.yellow),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.yellow,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
