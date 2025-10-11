import 'package:flutter/material.dart';

import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration(seconds: 3));
    Future.delayed(const Duration(seconds: 3), () {
      // ❌ This can crash or warn if the widget is disposed before this runs

      // ⚠️ What happens:
      // After 3 seconds, the callback runs.
      // But if the splash screen was disposed (e.g. user left app, or a rebuild happened),
      // the context is no longer valid.
      // Flutter warns:
      // “Don’t use BuildContext across async gaps (use_build_context_synchronously).”

      // ✅ Check if still mounted before using context

      // ✅ What’s good now:
      // The app waits 3 seconds as before.
      // If the SplashScreen is still part of the tree → it navigates.
      // If it was disposed → the callback exits silently, no error or warning.

      if (!mounted) return;
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/app_logo.png"),
      ),
    );
  }
}
