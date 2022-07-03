import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management/app/modules/data_view/views/data_view_view.dart';
import 'package:user_management/app/modules/home/views/home_view.dart';

class DataViewController extends GetxController {
  //TODO: Implement DataViewController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
  logout() async {
    Get.defaultDialog(
        title: 'Alert',
        middleText: 'Do You Want SignOut',
        titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textConfirm: 'Yes',
        textCancel: 'No',
        onConfirm: () async {
          FirebaseAuth auth = FirebaseAuth.instance;
          await auth.signOut();
          await Get.offAll(HomeView());
        },
        onCancel: () {
          Get.off(DataViewView());
        },
        confirmTextColor: Colors.white);
  }

  List itemList = [];
  final CollectionReference userList =
      FirebaseFirestore.instance.collection("newdata");
  Future getUserList() async {
    try {
      await userList.get().then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          itemList.add(element);
        }
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
    update();
  }
}
