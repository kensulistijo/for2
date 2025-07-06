// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  // User? user = FirebaseAuth.instance.currentUser;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Future<void> register(String email, String password) async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     print("✅ Registration successful");
  //   } catch (e) {
  //     print("❌ Registration failed: $e");
  //   }
  // }

  // Future<void> login(String email, String password) async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     print("✅ Login successful");
  //   } catch (e) {
  //     print("❌ Login failed: $e");
  //   }
  // }

  void increment() => count.value++;
}
