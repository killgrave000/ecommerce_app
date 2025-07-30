import 'package:get/get.dart';
import '../../presentation/controllers/auth_controller.dart';
import '../../presentation/controllers/product_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(ProductController());
  }
}
