import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapipracticesirin/edit.dart';
import 'package:flutterapipracticesirin/signup.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import 'controller/usercontroller.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final controller = Get.put(userController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-vector/isolated-tree-white-background_1308-26130.jpg?w=360"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "${controller.namecontroller.value.text}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text("${controller.emailcontroller.value.text}"),
              Text("${controller.phonecontroller.value.text}"),
              Text("${controller.getAge()}"),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Get.to(Edit());
                    },
                    child: Text(
                      "Personal Information",
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 0.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    items: <String>['EN', "AR"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Language",
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 0.5,
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  child: Text(
                    "Logout",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onTap: () {
                    controller.emailcontroller.clear();
                    controller.namecontroller.clear();
                    controller.phonecontroller.clear();
                    controller.dateofbirth = DateTime.now();
                    Get.to(SignUp());
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
