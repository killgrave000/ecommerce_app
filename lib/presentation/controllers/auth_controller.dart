import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signInWithGoogle() async {
    try {
      EasyLoading.show(status: 'Signing In...');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _auth.signInWithCredential(credential);
      EasyLoading.showSuccess('Welcome ${_auth.currentUser!.displayName}');
      Get.offAllNamed(AppRoutes.HOME);
    } catch (e) {
      EasyLoading.showError('Login failed: $e');
    }
  }
}
