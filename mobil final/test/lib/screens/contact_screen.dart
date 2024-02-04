import 'package:flutter/material.dart';
import 'package:isu_proje2/widgets/url_button.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            width: size.width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/movieContact.png',
                  height: size.height * 0.2,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: size.height * 0.05),
                SizedBox(
                  width: size.width * 0.9,
                  child: const Text(
                      textAlign: TextAlign.center,
                      'Share your suggestions and criticisms with us.',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
                ),
                SizedBox(height: size.height * 0.02),
                //URL LAUNCHER KULLANARAK TELEFON NUMARASINA YÖNLENDİREN KOD
                //URLLAUNCHERBUTTON'U WİDGET OLARAK AYIRDIM
                UrlLauncherButton(
                  title: 'Launch Phone Number',
                  icon: Icons.phone,
                  onPressed: () async {
                    Uri uri = Uri.parse('tel:+905777777777');
                    if (!await launcher.launchUrl(uri)) {
                      debugPrint("Could not launch the uri");
                    }
                  },
                ),
                //URL LAUNCHER KULLANARAK WEB SİTESİNE YÖNLENDİREN KOD
                //URLLAUNCHERBUTTON'U WİDGET OLARAK AYIRDIM
                SizedBox(height: size.height * 0.02),
                UrlLauncherButton(
                  title: 'Launch Website / URL',
                  icon: Icons.language,
                  onPressed: () {
                    launcher.launchUrl(
                      Uri.parse('https://flutter.dev'),
                      mode: launcher.LaunchMode.externalApplication,
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
