import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xff18181B),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.9,
              height: size.height * 0.05,
              child: const Text(
                textAlign: TextAlign.center,
                'Welcome to my movie app',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            SizedBox(
              width: size.width * 0.9,
              height: size.height * 0.1,
              child: const Text(
                textAlign: TextAlign.center,
                'Please select an option.',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                  child: Image.asset(
                    'assets/images/login.png',
                    width: size.width * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
                  },
                  child: Image.asset(
                    'assets/images/register.png',
                    width: size.width * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
