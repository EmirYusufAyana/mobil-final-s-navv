import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //MAİL CONTROLLER OLUŞTURDUK
  final TextEditingController emailController = TextEditingController(text: "");

  //VERİTABANINA KAYDETTİĞİMİZ MAİLİ UYGULAMA AÇILINCA OKUMAK İÇİN
  readData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    var email = storeage.getString("email");

    setState(() {
      emailController.text = email ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    //BU SAYFA AÇILINCA VERİYİ GÖSTER
    readData();
  }

  //VERİTABANINA KAYDEDİLEN VERİYİ SİLMEK İÇİN. YANİ ÇIKIŞ YAPMAK İÇİN LOGOUT
  clearData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    storeage.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(5.0),
        child: SizedBox(
          height: size.height * 0.08,
          width: size.width * 0.8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: () {
              //LOGOUT TUŞUNA BASINCA VERİYİ SİLİP welcome SAYFASINA ATIYOR
              clearData();
              Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: size.width * 0.05),
                const Text(
                  'Logout',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
