import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../controllers/productcontroller.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({super.key});

  final productcontroller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: productcontroller.productonemap.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(" this is ${productcontroller.productonemap.length}");
                    return Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(productcontroller.productonemap[index].title
                              .toString()),
                          SizedBox(
                            height: 12,
                          ),
                          Text(productcontroller
                              .productonemap[index].description
                              .toString()),
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
