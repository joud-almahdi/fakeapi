
import 'package:apipracticeusingfakeapi/views/viewingcategoryproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../Strings/strings.dart';
import '../controllers/productcontroller.dart';

class ViewingCategory extends StatelessWidget {
  ViewingCategory({super.key});
  final categorycontroller = Get.put(ProductController());

  List categories = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (categories[index] == "electronics") {
                        categoryurl = "electronics";
                      } else if (categories[index] == "jewelery") {
                        categoryurl = "jewelery";
                      } else if (categories[index] == "men's clothing") {
                        categoryurl = "men's clothing";
                      } else {
                        categoryurl = "women's clothing";
                      }
                      fullcategoryurl =
                          "https://fakestoreapi.com/products/category/${categoryurl}";

                      categorycontroller.getProductByCategory(categoryurl);

                      Get.to(ViewingProductByCategory());
                    },
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(categories[index].toString()),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
