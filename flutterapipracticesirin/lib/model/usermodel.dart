import 'dart:convert';


List<usermodel> userModelFromJson(String str) => List<usermodel>.from(
    json.decode(str).map((x) => usermodel.fromJson(x)));

String userModelToJson(List<usermodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class usermodel {
  String? email;
  String? name;
  int? phoneNum;
  int? birthDate;
  String? id;

  usermodel({this.email, this.name, this.phoneNum, this.birthDate, this.id});

  usermodel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phoneNum = json['phone_num'];
    birthDate = json['birth_date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone_num'] = this.phoneNum;
    data['birth_date'] = this.birthDate;
    data['id'] = this.id;
    return data;
  }
}