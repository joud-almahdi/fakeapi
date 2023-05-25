import 'package:flutterapipracticesirin/controller/taskcontroller.dart';
import 'package:get/get.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(taskController());
  }
}
