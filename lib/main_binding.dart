import 'package:get/get.dart';
import 'package:ssu/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
