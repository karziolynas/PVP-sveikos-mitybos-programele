import 'package:flutter/material.dart';
import 'package:projecthealthapp/common/auth.dart';
import 'package:projecthealthapp/presentation/screens/login_screen.dart';
import 'package:projecthealthapp/presentation/screens/personalization_begin.dart';
import 'package:projecthealthapp/presentation/screens/splash_screen.dart';

class AuthStateChecker extends StatefulWidget {
  const AuthStateChecker({super.key});

  @override
  State<AuthStateChecker> createState() => _AuthStateCheckerState();
}

class _AuthStateCheckerState extends State<AuthStateChecker> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashPage(); // Show splash screen while checking auth state
          } else {
            if (snapshot.hasData) {
              return const personalization_begin(); // User authenticated, show home screen
            } else {
              return const LoginScreen(); // User not authenticated, show login screen
            }
          }
        });
  }
}
