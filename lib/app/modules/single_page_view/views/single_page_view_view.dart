import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:user_management/app/modules/edit_screen/views/edit_screen_view.dart';

import '../controllers/single_page_view_controller.dart';

class SinglePageViewView extends GetView<SinglePageViewController> {
  final datas;

  SinglePageViewView({this.datas});
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final dataq = datas['image'];
    var images2 = Base64Decoder().convert(dataq);

    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(22, 186, 197, 1),
        shadowColor: Color.fromRGBO(22, 186, 197, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Color.fromARGB(255, 187, 198, 200).withOpacity(.5),
            elevation: 70,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 14.0, bottom: 40),
                    child: Text(
                      'Profile Details',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 100),
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 38.0),
                    child: CircleAvatar(
                      backgroundImage: MemoryImage(images2),
                      radius: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Name : ',
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          datas['Name'],
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Age :',
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(datas['age'],
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w300))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Number :',
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(datas['Number'],
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w300))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 20, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'E-mail :',
                          style: TextStyle(fontSize: 30),
                        ),
                        AutoSizeText(
                          datas['email'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  datas['uid'] == auth.currentUser!.uid
                      ? ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(22, 186, 197, 1),
                            ),
                          ),
                          onPressed: () async {
                            Get.to(EditScreenView(
                              dataEdit: datas,
                              editor: true,
                            ));
                          },
                          child: const Text('Edit-Data'),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
