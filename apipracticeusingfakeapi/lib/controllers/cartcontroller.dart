// import 'package:apipracticeusingfakeapi/controllers/productcontroller.dart';
// import 'package:apipracticeusingfakeapi/models/productmodel.dart';
// import 'package:get/get.dart';


// class cartcontroller extends GetxController {
//   var cartmap = <cartmodel>[].obs;
//   var isLoading = true.obs;
//   final productcontroller = Get.put(ProductController());

//   final cart = <productmodel>[].obs;
//   void cartfiltering() {
//     cartmap.forEach(
//       (element) {
//         productcontroller.productmap.forEach((element2) {
//           if (element.id == element2.id) {
//             cart.add(element2);
//           }
//         });
//       },
//     );
//   }

//   void getProductfromcart() async {
//     var product = await cartservices.getproductfromcart();
//     try {
//       isLoading(true);
//       if (product.isNotEmpty) {
//         cartmap.addAll(product);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }
