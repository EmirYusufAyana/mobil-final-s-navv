import 'package:flutter/material.dart';
import 'package:isu_proje2/screens/home_screen.dart';
import 'package:isu_proje2/screens/login_screen.dart';
import 'package:isu_proje2/screens/onboarding_screen.dart';
import 'package:isu_proje2/screens/profile_screen.dart';
import 'package:isu_proje2/screens/register_screen.dart';
import 'package:isu_proje2/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //uygulamanın başlayacağı sayfa
      initialRoute: '/onboarding',
      //Navigatorlar yani sayfaların ismi isimlere göre geçiş yapılıyor
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
