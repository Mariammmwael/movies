import 'package:flutter/material.dart';
import 'package:movieapp/features/onboarding/introduction_screen.dart';

import '../../core/theme/app_assets.dart';
import '../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  static const String routeName = 'Splash-Screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(IntroductionScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child:Image.asset(AppAssets.appLogo,
          width:MediaQuery.of(context).size.width*0.5,


        ),

      ),

    );
  }
}