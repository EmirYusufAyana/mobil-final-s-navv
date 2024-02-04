import 'package:flutter/material.dart';
import 'package:isu_proje2/models/movie_model.dart';
import 'package:isu_proje2/screens/contact_screen.dart';
import 'package:isu_proje2/screens/movie_screen.dart';
import 'package:isu_proje2/screens/profile_screen.dart';
import 'package:isu_proje2/widgets/movie_list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //DRAWER'IN SEÇİLİ GELEN ELEMANININ İNDEXİNİ AYARLIYORUZ. HANGİ İNDEXTEKİ SAYFA GELSİN DİYE SAYFA 0 HOME
  int _selectedIndex = 0;

  //BASTIĞIMIZ SAYFAYA GİTMEK İÇİN.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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

  //İNDEX 0 İSE HOME İNDEX 1 İSE CONTACT İNDEX 2 İSE PROFİLE PAGE E GİTSİN DİYORUZ. DRAWER DA BASTIĞIMIZDA GİTMESİNİ SAĞLIYORUZ.
  Widget buildBodyContent(int index) {
    List<Movie> movies = Movie.movies;
    final size = MediaQuery.of(context).size;
    if (index == 0) {
      return home(size, context, movies);
    } else if (index == 1) {
      return const ContactScreen();
    } else if (index == 2) {
      return const ProfileScreen();
    } else {
      return const Text('Debug');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Movies',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      extendBodyBehindAppBar: true,
      body: buildBodyContent(_selectedIndex),
      drawer: Drawer(
        elevation: 5,
        backgroundColor: Colors.deepOrange,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/200/300'), radius: 50),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    //EĞER YENİ BİR KAYIT OLUŞTURUYORSA PROFİLDE O KISMIN MAİL ADRESİ YAZSIN EĞER SERVİSTEKİ KULLANICI İLE GİRİŞ YAPIYORSA ONU GÖSTERMESİ İÇİN SORGU
                    emailController.text.isNotEmpty ? emailController.text : 'eve.holt@reqres.in',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Contact us',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView home(Size size, BuildContext context, List<Movie> movies) {
    return SingleChildScrollView(
      //aşağı kayması
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.16,
              horizontal: size.width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleLarge,
                    children: [
                      TextSpan(
                        text: 'Featured ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const TextSpan(text: 'Movies'),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                for (final movie in movies)
                  InkWell(
                    //burda diğer sayfaya gidişi sağladım
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieScreen(movie: movie),
                          ));
                    },
                    child: MovieListItem(
                      imageUrl: movie.imagePath,
                      name: movie.name,
                      information:
                          '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m',
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
