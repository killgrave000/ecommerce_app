import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.login),
          label: Text('Sign in with Google'),
          onPressed: () => authController.signInWithGoogle(),
        ),
      ),
    );
  }
}
