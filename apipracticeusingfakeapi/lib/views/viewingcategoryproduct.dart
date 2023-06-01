
import 'package:apipracticeusingfakeapi/controllers/productcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ViewingProductByCategory extends StatelessWidget {
  ViewingProductByCategory({
    super.key,
  });

  final productcontroller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              productcontroller.categorymap.clear();
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: productcontroller.categorymap.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(productcontroller.categorymap[index].title
                              .toString()),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
