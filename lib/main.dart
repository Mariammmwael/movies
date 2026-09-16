import 'package:flutter/material.dart';
import 'package:movies/features/forget_password_screen.dart';
import 'package:movies/features/login_screen.dart';
import 'package:movies/features/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        '/login': (context) => LoginScreen(),
        '/forget_password': (context) => ForgetPasswordScreen(),
        '/register':(context) => RegisterScreen(),
      },
    );
  }
}
