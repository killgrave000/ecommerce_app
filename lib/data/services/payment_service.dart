import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentService {
  static Future<void> makePayment({
    required String amount,
    required String currency,
  }) async {
    try {
      // 1. Create a PaymentIntent
      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer sk_test_51RqaTk2OQIalIgHwggVL1Oy3YPeFGmsjg1KrywmZSqkXRhs0SeWfyT32OrfD0NgPQUoaE1Fc8FuHPAZXsq6eGV6S00Q1V7Qfyl', // ✅ Test key only
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': amount, // must be in cents (e.g., $10 → 1000)
          'currency': currency,
          'payment_method_types[]': 'card',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create PaymentIntent: ${response.body}');
      }

      final json = jsonDecode(response.body);
      final clientSecret = json['client_secret'];

      if (clientSecret == null) {
        throw Exception('Stripe response missing client_secret');
      }

      // 2. Initialize Stripe Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Demo Store',
        ),
      );

      // 3. Present the payment sheet
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception('Stripe Payment Failed: $e');
    }
  }
}
