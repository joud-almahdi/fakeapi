import 'dart:convert';
import 'package:apipracticeusingfakeapi/models/productmodel.dart';
import 'package:http/http.dart' as http;
import '../Strings/strings.dart';

class productservices {
  static Future<List<productmodel>> getproduct() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      print(jsonData);
      return todoModelFromJson(jsonData);
    } else {
      return throw Exception("Faild to loadd");
    }
  }

  static Future<List<productmodel>> getoneproduct(
      String productendpoint) async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products/1"));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      print(jsonData);
      return todoModelFromJson(jsonData);
    } else {
      return throw Exception("Faild to load");
    }
  }

  static Future<List<productmodel>> getproductbycategory(
      String categoryendpoint) async {
    var response = await http.get(Uri.parse(
        "https://fakestoreapi.com/products/category/${categoryendpoint}"));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      print(jsonData);
      return todoModelFromJson(jsonData);
    } else {
      return throw Exception("Faild to load");
    }
  }
}
