import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:isu_proje2/models/login_model.dart';

class Service {
  final String baseUrl = "https://reqres.in/api/register";

  //LOGİN İŞLEMİ İÇİN YAZILDI. POST MODELDEKİ TOKEN DÖNÜYOR
  Future<LoginModel?> login(String email, String password) async {
    //POST METHODU İLE VERİ GÖNDERİYORUZ
    var response = await http.post(Uri.parse(baseUrl),
        //EMAİL VE PASSWORD GÖNDERİYORUZ
        body: ({
          'email': email,
          'password': password,
        }));
    //EĞER DÖNEN CEVAP KODU 200 İSE BİR SIKINTI YOKSA CEVABI ALIYORUZ
    if (response.statusCode == 200) {
      var jsonBody = LoginModel.fromJson(jsonDecode(response.body));
      return jsonBody;
    } else {
      //DEĞİLSE HATA MESAKI YAYINLAR
      if (kDebugMode) {
        print("İstek başarısız oldu => ${response.statusCode}");
      }
    }
    return null;
  }
}
