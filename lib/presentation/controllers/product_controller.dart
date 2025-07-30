import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../data/services/api_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  final _apiService = ApiService();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      EasyLoading.show(status: 'Loading Products...');
      final products = await _apiService.fetchProducts();
      productList.assignAll(products);
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError('Failed to load: $e');
    }
  }
}
