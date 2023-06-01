import 'package:apipracticeusingfakeapi/models/productmodel.dart';
import 'package:apipracticeusingfakeapi/services/productservices.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productmap = <productmodel>[].obs;
  var productonemap = <productmodel>[].obs;
  var categorymap = <productmodel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    var product = await productservices.getproduct();
    try {
      isLoading(true);
      if (product.isNotEmpty) {
        productmap.addAll(product);
        print(productmap[0].title);
      }
    } finally {
      isLoading(false);
    }
  }

  void getONEProduct(String productendpoint) async {
    var product = await productservices.getoneproduct(productendpoint);
    try {
      isLoading(true);
      if (product.isNotEmpty) {
        productonemap.addAll(product);
        print(productonemap.length);
      }
    } finally {
      isLoading(false);
    }
  }

  void getProductByCategory(String categoryendpoint) async {
    var product = await productservices.getproductbycategory(categoryendpoint);
    try {
      isLoading(true);
      if (product.isNotEmpty) {
        categorymap.addAll(product);
        print(categorymap[0].title);
      }
    } finally {
      isLoading(false);
    }
  }
}
