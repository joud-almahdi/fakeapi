import 'package:flutterapipracticesirin/services/todoservices.dart';
import 'package:get/get.dart';

import '../model/todomodel.dart';

class taskController extends GetxController {
  var taskmap = <todomodel>[].obs;
  var isLoading = true.obs;
  var title = "";
  var description = "";
  var id = "";
  @override
  void onInit() {
    getTasks();
    print("object");
    super.onInit();
  }

  void getTasks() async {
    var tasks = await todoServices.gettask();
    try {
      isLoading(true);
      if (tasks.isNotEmpty) {
        taskmap.addAll(tasks);
        print(taskmap[0].userId);
      }
    } finally {
      isLoading(false);
    }
  }

  void addTask(String title, String description) async {
    await todoServices.addTask(title, description);
  }

  void deleteTask(String id) async {
    await todoServices.deletetask(id);
  }

  void updatetask(String title, String description, String id) async {
    await todoServices.updatetask(title, description, id);
  }
}
