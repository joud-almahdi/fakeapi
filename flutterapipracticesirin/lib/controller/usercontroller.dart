import 'package:flutter/cupertino.dart';
import 'package:flutterapipracticesirin/services/userservices.dart';
import 'package:get/get.dart';
import 'package:time_machine/time_machine.dart';

import '../model/usermodel.dart';

class userController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  DateTime dateofbirth = DateTime.now();
  var usersmap = <usermodel>[].obs;
  var isLoading = true.obs;

  int dateepoch = 0;

  void adduser(String email, String name, int phonenumber) async {
    dateepoch = dateofbirth.millisecondsSinceEpoch;
    await userServices.registeruser(email, name, phonenumber, dateepoch);
  }

  String getAge() {
    DateTime a = DateTime.now();
    DateTime b = DateTime.fromMillisecondsSinceEpoch(dateepoch);
    print(" hi its me ${b}");
    int totalDays = a.difference(b).inDays;
    int years = totalDays ~/ 365;
    int months = (totalDays - years * 365) ~/ 30;
    int days = totalDays - years * 365 - months * 30;
    print("$years $months $days $totalDays");
    return "years: ${years}; months: ${months}; days: ${days}";
  }

  void updateinfo(String email, String name, int phonenumber, String id) async {
    await userServices.updateinfo(email, name, phonenumber, id);
  }

  void getUsers() async {
    var tasks = await userServices.getuser();
    try {
      isLoading(true);
      if (tasks.isNotEmpty) {
        usersmap.addAll(tasks);
        int phone = int.parse(phonecontroller.value.text);
        var id = usersmap.value.where((element) => element.phoneNum == phone);
        print(id);
      }
    } finally {
      isLoading(false);
    }
  }
}
