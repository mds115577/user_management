import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data_view/views/data_view_view.dart';

class EditScreenController extends GetxController {
  //TODO: Implement EditScreenController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
  final firstnameformController = TextEditingController();
  final lastnameformController = TextEditingController();
  final numberEditimg = TextEditingController();
  Future updateFunction(final data) async {
    final docUser =
        FirebaseFirestore.instance.collection('newdata').doc(data['uid']);
    await docUser.update({
      'Name': firstnameformController.text,
      'age': lastnameformController.text,
      'Number': numberEditimg.text,
      'image': image,
    }).whenComplete(() {
      Get.snackbar('Alert', 'Account Succesfully updated',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
      Get.offAll(DataViewView());
    });
  }

  File? imagePath;
  String image = '';
  picksimage() async {
    final pimage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pimage == null) {
      return;
    } else {
      imagePath = File(pimage.path);

      final bytes = File(pimage.path).readAsBytesSync();
      image = base64Encode(bytes);
    }
    update();
  }
}
