import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xff18181B),
        body: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'assets/images/onboarding.png',
                width: size.width,
                height: size.height * 0.5,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: size.width * 0.7,
                height: size.height * 0.11,
                child: const Text(
                  textAlign: TextAlign.center,
                  'Movie App',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              SizedBox(
                width: size.width * 0.7,
                height: size.height * 0.10,
                child: const Text(
                  textAlign: TextAlign.center,
                  'Watch everything you want for free!',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
                },
                child: Image.asset(
                  'assets/images/button.png',
                  width: size.width * 0.8,
                  height: size.height * 0.2,
                ),
              )
            ],
          ),
        ));
  }
}
