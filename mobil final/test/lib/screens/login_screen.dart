import 'package:flutter/material.dart';
import 'package:isu_proje2/service/login_service.dart';
import 'package:isu_proje2/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //VERİLERİ UYGULAMA KAPANIRSA VEYA YENİDEN BAŞLATILIRSA DİYE SAKLAMAK İÇİN SHAREDPREFERENCES KULLANDIK. LOCAL VERİTABANI
  storeData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    storeage.setString("Email", _emailController.text);
  }

  //KAYDETTİĞİMİZ VERİLERİ EKRANDA GÖSTERMEK İÇİN YAZILDI
  readData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    var mail = storeage.getString("Email");

    setState(() {
      _emailController.text = mail ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    //BU SAYFA AÇILDIĞINDA KAYDEDİLEN VERİLERİ EKRANDA GÖSTERMEK İÇİN
    readData();
  }

  //SERVİSİ BURADA KULLANMAK İÇİN NESNSEYİ OLUŞTURUYORUZ
  final Service _service = Service();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/images/background.jpg',
          height: size.height,
          width: size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
              const Text('Sign In', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.02),
              //BU WİDGETI KENDİMİZ OLUŞTURDUK ÇAĞIIRYORUZ
              CustomTextField(
                labeltext: 'E-mail',
                icon: const Icon(Icons.mail),
                obsecureText: false,
                controller: _emailController,
              ),
              SizedBox(height: size.height * 0.02),
              CustomTextField(
                icon: const Icon(Icons.key),
                labeltext: 'Password',
                obsecureText: true,
                controller: _passwordController,
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                height: size.height * 0.07,
                width: size.width * 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () async {
                    //WEB SERVİSE ATTIĞIMIZ İSTEK İLE GİRİLEN ŞİFRE EŞİT Mİ DEĞİL Mİ KONTROLU YAPILIYOR
                    if (_passwordController.text == 'pistol') {
                      //EŞİTSE GİRİŞ BAŞARILI OLUYOR VE VERİLER VERİTABANINA KAYIT EDİLİYOR
                      _service.login(_emailController.text, _passwordController.text);
                      storeData();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('login success')));
                      await Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                    } else {
                      //DEĞİLSE ŞİFRE HATALI
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login failed')));
                    }
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Don’t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: size.width * 0.05),
                  SizedBox(
                    height: size.height * 0.05,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
                        },
                        child: const Text(
                          'create',
                          style: TextStyle(color: Colors.deepOrange),
                        )),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
