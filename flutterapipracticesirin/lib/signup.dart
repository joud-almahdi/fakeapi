import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapipracticesirin/controller/usercontroller.dart';
import 'package:flutterapipracticesirin/home.dart';
import 'package:flutterapipracticesirin/profile.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String date = "Birth Date";
  DateTime? birthdate = DateTime.now();
  final controller = Get.put(userController());
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                        labelText: 'Full name',
                      )),
                  SizedBox(height: 20),
                  TextField(
                      controller: controller.phonecontroller,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
                      )),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        DateTime? birthdate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now());
                        if (birthdate == null) {
                          return;
                        }
                        setState(() {
                          controller.dateofbirth = birthdate;
                          date =
                              "${birthdate.day} ${DateFormat.MMMM().format(birthdate)} ${birthdate.year}";
                        });
                      },
                      child: Text(date),
                      style: ButtonStyle(),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (date == "Birth Date") {
                            print("enter birthdat");
                          } else {
                            //DateTime datetimeformat = DateTime.parse(birthdate);
                            controller.adduser(
                              controller.emailcontroller.value.text,
                              controller.namecontroller.value.text,
                              int.parse(controller.phonecontroller.value.text),
                            );
                            print(controller.dateofbirth);
                            Get.off(Home());
                          }
                        },
                        child: Text("Signup"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
