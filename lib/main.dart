import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/features/forget_password_screen.dart';
import 'package:movies/features/home/home_screen.dart';
import 'package:movies/features/login_screen.dart';
import 'package:movies/features/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
      initialRoute: LoginScreen.routeName,
      routes: {
        '/login': (context) => LoginScreen(),
        '/forget_password': (context) => ForgetPasswordScreen(),
        '/register': (context) => RegisterScreen(),
        'homescreen': (context) => HomeScreen(),
      },
    );
  }
}
