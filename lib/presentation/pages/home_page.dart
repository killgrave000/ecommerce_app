import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';
import '../widgets/theme_toggle.dart';

class HomePage extends StatelessWidget {
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Add your logout logic here if needed
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ThemeToggle(), // 💡 Dark Mode toggle switch
          ),
          Expanded(
            child: Obx(() {
              return GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: productController.productList.length,
                itemBuilder: (_, index) {
                  final product = productController.productList[index];
                  return ProductCard(product: product);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
