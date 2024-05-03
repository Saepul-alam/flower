import 'package:flowers/app/modules/login/controllers/login_controller.dart';
import 'package:flowers/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final loginController = Get.put(LoginController());
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    GetStorage().write("status", "login"); // Perbaikan: Menggunakan GetStorage().write
  }

  @override
  void onReady() {
    super.onReady();
    print("onready splashscreencontroller");
    if (GetStorage().read("status") != "" && GetStorage().read("status") != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.LOGIN); // Perbaikan: Menggunakan Get.offAllNamed
      });
    } else {
      Get.offAllNamed(Routes.LOGIN); // Perbaikan: Menggunakan Get.offAllNamed
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
