import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapipracticesirin/controller/taskcontroller.dart';
import 'package:flutterapipracticesirin/model/todomodel.dart';
import 'package:flutterapipracticesirin/profile.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:expansion_card/expansion_card.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final taskcontroller = Get.put(taskController());
  todomodel todo = todomodel();
  String title = "";
  String description = "";
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.lightBlue,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.lightBlue),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(Profile());
              },
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-vector/isolated-tree-white-background_1308-26130.jpg?w=360"),
                  )),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: taskcontroller.taskmap.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpansionCard(
                        backgroundColor: Colors.white,
                        title: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  taskcontroller.taskmap[index].title
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                taskcontroller.taskmap[index].description
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.lightBlue, fontSize: 18),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${DateTime.parse(taskcontroller.taskmap[index].date.toString()).day} ${DateFormat.MMMM().format(DateTime.parse(taskcontroller.taskmap[index].date.toString()))} ${DateTime.parse(taskcontroller.taskmap[index].date.toString()).year}",
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    taskcontroller.deleteTask(taskcontroller
                                        .taskmap[index].id
                                        .toString());
                                  },
                                  child: Text("Delete")),
                              TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              "Update item",
                                              style: TextStyle(
                                                  color: Colors.lightBlue),
                                            ),
                                            content: Container(
                                              width: 400,
                                              height: 100,
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    onChanged: (String value) {
                                                      title = value;
                                                    },
                                                  ),
                                                  TextField(
                                                    onChanged: (String value) {
                                                      description:
                                                      value;
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  taskcontroller.addTask(
                                                      title, description);
                                                  taskcontroller.update();
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("Save",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.lightBlue)),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  child: Text("Edit"))
                            ],
                          )
                        ],
                      );
                    }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Add item",
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                      content: Container(
                        width: 400,
                        height: 100,
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (String value) {
                                title = value;
                              },
                            ),
                            TextField(
                              onChanged: (String value) {
                                description = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            taskcontroller.addTask(title, description);
                            taskcontroller.update();
                            Navigator.of(context).pop();
                          },
                          child: Text("Save",
                              style: TextStyle(color: Colors.lightBlue)),
                        )
                      ],
                    );
                  });
            },
            child: Icon(Icons.add)),
      );
    });
  }
}
