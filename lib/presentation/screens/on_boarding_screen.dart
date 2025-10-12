import 'package:flutter/material.dart';
import 'package:library_system_application/presentation/screens/screen_wrapper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                "assets/images/on_boarding_img.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned(
                top: 342,
                left: 112,
                child: Image.asset("assets/images/app_logo.png"),
              ),
            ],
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Read more and stress less with our online book shopping app. "
              "Shop from anywhere you are and discover titles that you love. "
              "Happy reading!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                height:
                    1.5, //// adds a bit of spacing between lines for readability
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 100),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return const ScreenWrapper();
                  },
                ),
              );
            },
            child: Container(
              width: 320,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Text('Register')),
        ],
      ),
    );
  }
}
