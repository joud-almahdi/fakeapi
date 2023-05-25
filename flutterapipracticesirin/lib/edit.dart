import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapipracticesirin/profile.dart';
import 'package:get/get.dart';

import 'controller/usercontroller.dart';

class Edit extends StatelessWidget {
  Edit({super.key});
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
              SizedBox(height: 70),
              Text(
                "Edit Account",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 70),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    TextField(
                        controller: controller.emailcontroller,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        )),
                    SizedBox(height: 20),
                    TextField(
                        controller: controller.namecontroller,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: controller.phonecontroller,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                        )),
                    SizedBox(height: 70),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            // controller.updateinfo(
                            //     controller.emailcontroller.text,
                            //     controller.namecontroller.text,
                            //     int.parse(controller.phonecontroller.text));
                            Get.to(Profile());
                          },
                          child: Text("Edit"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
