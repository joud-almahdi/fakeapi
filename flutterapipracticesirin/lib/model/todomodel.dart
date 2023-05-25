import 'dart:convert';

List<todomodel> todoModelFromJson(String str) =>
    List<todomodel>.from(json.decode(str).map((x) => todomodel.fromJson(x)));

String todoModelToJson(List<todomodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class todomodel {
  String? title;
  String? description;
  String? date;
  String? userId;
  String? id;

  todomodel({this.title, this.description, this.date, this.userId, this.id});

  todomodel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    date = json['date'];
    userId = json['user_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    data['user_id'] = this.userId;
    data['id'] = this.id;
    return data;
  }
}
