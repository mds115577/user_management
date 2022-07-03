import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data_view/views/data_view_view.dart';
import '../widgets/sign_up_model.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  final firstNameEditingController = TextEditingController();
  final ageediting = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordController = TextEditingController();
  final numberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;

  signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetails()})
          .catchError((e) {});
    }
  }

  postDetails() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    DataModel dataModel = DataModel();
    dataModel.image = img;
    dataModel.uid = user!.uid;
    dataModel.email = user.email;
    dataModel.Name = firstNameEditingController.text;
    dataModel.age = ageediting.text;
    dataModel.Number = numberController.text;
    await firebaseFirestore
        .collection("newdata")
        .doc(user.uid)
        .set(dataModel.toMap());
    print('data uploaded');
    Get.snackbar('Alert', 'Account Succesfully created',
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
    Get.offAll(DataViewView());
  }

  File? image;
  String img = '';
  pickimage() async {
    final pimage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pimage == null) {
      return;
    } else {
      image = File(pimage.path);

      final bytes = File(pimage.path).readAsBytesSync();
      img = base64Encode(bytes);
    }
    update();
  }
}
