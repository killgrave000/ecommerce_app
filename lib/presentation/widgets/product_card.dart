import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../data/services/payment_service.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  void buyNow() async {
    try {
      EasyLoading.show(status: 'Processing...');
      // Stripe requires amount in cents
      final intAmount = (product.price * 100).toInt().toString();

      await PaymentService.makePayment(
        amount: intAmount,
        currency: 'usd',
      );

      EasyLoading.showSuccess('Payment Successful!');
    } catch (e) {
      EasyLoading.showError('Payment Failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: Image.network(product.image, fit: BoxFit.contain)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          ElevatedButton(
            onPressed: buyNow,
            child: Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}
