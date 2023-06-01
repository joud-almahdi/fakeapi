import 'package:apipracticeusingfakeapi/Strings/strings.dart';
import 'package:apipracticeusingfakeapi/controllers/cartcontroller.dart';
import 'package:apipracticeusingfakeapi/views/viewingCategory.dart';
import 'package:apipracticeusingfakeapi/views/viewingproductdetail.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import '../controllers/productcontroller.dart';

class ViewingProduct extends StatelessWidget {
  ViewingProduct({super.key});
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
                  itemCount: productcontroller.productmap.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        productid =
                            productcontroller.productmap[index].id.toString();
                        print(productid);
                        productcontroller.getONEProduct(productid);
                        fullcategoryurl =
                            "https://fakestoreapi.com/products/category/${productid}";

                        Get.to(ProductDetail());
                      },
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Text(productcontroller.productmap[index].title
                                .toString()),
                            SizedBox(
                              height: 12,
                            ),
                            Text(productcontroller.productmap[index].description
                                .toString()),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.to(ViewingCategory());
                    },
                    child: Text("Category")),
                ElevatedButton(onPressed: () {}, child: Text("Cart"))
              ],
            )
          ],
        ),
      );
    });
  }
}
