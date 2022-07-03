import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<User?> loginFunct(
      {required String email,
      required String password,
      required BuildContext}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    return user;
  }
}
