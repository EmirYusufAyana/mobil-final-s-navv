import 'package:flutter/material.dart';
import 'package:isu_proje2/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //CONTROLLERLAR OLUŞTURULDU
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController fullNameController = TextEditingController(text: "");
  final TextEditingController passwordController = TextEditingController(text: "");
  final TextEditingController confirmPasswordController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    //SAYFA AÇILINCA KAYDEDİLERN VERİYİ GÖSTER
    readData();
  }

  //YENİ KAYIT OLUŞTURURKEN VERİLERİ VERİTABANINA KAYDETMEK İÇİN
  storeData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();

    storeage.setString("email", emailController.text);
    storeage.setString("fullName", fullNameController.text);
    storeage.setString("password", passwordController.text);
    storeage.setString("again", confirmPasswordController.text);
  }

  //OLUŞTURULAN VERİYİ TEMİZLEMEK İÇİN
  clearData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    storeage.clear();
  }

  //KAYDEDİLEN VERİYİ OKUMAK İÇİN
  readData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    var email = storeage.getString("email");
    var fullName = storeage.getString("fullName");
    var password = storeage.getString("password");
    var passwordAgain = storeage.getString("again");

    setState(() {
      emailController.text = email ?? '';
      fullNameController.text = fullName ?? '';
      passwordController.text = password ?? '';
      confirmPasswordController.text = passwordAgain ?? '';
    });
  }

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
              const Text('Register', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.02),
              //BU WİDGETI KENDİMİZ OLUŞTURDUK ÇAĞIIRYORUZ
              CustomTextField(
                labeltext: 'E-mail',
                icon: const Icon(Icons.mail),
                obsecureText: false,
                controller: emailController,
              ),
              SizedBox(height: size.height * 0.01),

              CustomTextField(
                icon: const Icon(Icons.person),
                labeltext: 'Full Name',
                obsecureText: false,
                controller: fullNameController,
              ),
              SizedBox(height: size.height * 0.01),

              CustomTextField(
                icon: const Icon(Icons.key),
                labeltext: 'Password',
                obsecureText: true,
                controller: passwordController,
              ),
              SizedBox(height: size.height * 0.01),
              CustomTextField(
                icon: const Icon(Icons.key),
                labeltext: 'Password Again',
                obsecureText: true,
                controller: confirmPasswordController,
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
                  onPressed: () {
                    //EĞER KONTROLLERLAR BOŞSA UYARI VERMESİ İÇİN İF
                    if (emailController.text.isEmpty ||
                        fullNameController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Please fill in all fields.')));
                      //EĞER Kİ ŞİFRELER EŞİT DEĞİLSE UYARI VERECEK
                    } else if (passwordController.text != confirmPasswordController.text) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Please enter the same passwords.')));
                    } else {
                      //HER ŞEY NORMAL İSE HOME SAYFASINA YÖNLENDİRECEK VE VERİLERİ VERİTABANINA KAYDEDECEK
                      storeData();
                      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data Saved')));
                    }
                  },
                  child: const Text(
                    'Create',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
