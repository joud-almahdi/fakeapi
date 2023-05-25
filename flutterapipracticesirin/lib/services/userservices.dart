import '../model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class userServices {
  static Future<List<usermodel>> register() async {
    var response = await http
        .get(Uri.parse("https://64609b83ca2d89f7e75b487e.mockapi.io/user"));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return userModelFromJson(jsonData);
    } else {
      return throw Exception("Faild to load");
    }
  }

  static Future<usermodel> registeruser(
      String email, String name, int phonenumber, int birthdate) async {
    final response = await http.post(
      Uri.parse("https://64609b83ca2d89f7e75b487e.mockapi.io/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "email": email,
        "name": name,
        'phone_num': phonenumber,
        "birth_date": birthdate,
      }),
    );
    if (response.statusCode == 201) {
      return usermodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode.toString());
    }
  }

  static Future<usermodel> updateinfo(
      String email, String name, int phonenumber, String id) async {
    final response = await http.put(
      Uri.parse('https://64609b83ca2d89f7e75b487e.mockapi.io/user/${id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        "name": name,
        'phone_num': phonenumber,
      }),
    );

    if (response.statusCode == 200) {
      return usermodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  static Future<List<usermodel>> getuser() async {
    var response = await http
        .get(Uri.parse("https://64609b83ca2d89f7e75b487e.mockapi.io/user"));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return userModelFromJson(jsonData);
    } else {
      return throw Exception("Faild to load");
    }
  }
}
