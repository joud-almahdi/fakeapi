import 'dart:convert';

import 'package:flutterapipracticesirin/model/todomodel.dart';
import 'package:http/http.dart' as http;

class todoServices {
  static Future<List<todomodel>> gettask() async {
    var response = await http
        .get(Uri.parse("https://64609b83ca2d89f7e75b487e.mockapi.io/todo"));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return todoModelFromJson(jsonData);
    } else {
      return throw Exception("Faild to load");
    }
  }

  static Future<todomodel> addTask(String title, String description) async {
    final response = await http.post(
      Uri.parse("https://64609b83ca2d89f7e75b487e.mockapi.io/todo"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "title": title,
        "description": description,
        "date": DateTime.now().toString(),
      }),
    );
    if (response.statusCode == 201) {
      return todomodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("faild");
    }
  }

  static Future<todomodel> updatetask(
      String title, String description, String id) async {
    final response = await http.put(
      Uri.parse('https://64609b83ca2d89f7e75b487e.mockapi.io/todo/${id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        "description": description,
      }),
    );

    if (response.statusCode == 200) {
      return todomodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  static Future<todomodel> deletetask(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://64609b83ca2d89f7e75b487e.mockapi.io/todo/${id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return todomodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete album.');
    }
  }
}
