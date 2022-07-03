import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../sign_up/controllers/sign_up_controller.dart';
import '../controllers/edit_screen_controller.dart';

class EditScreenView extends GetView<EditScreenController> {
  bool? editor;
  final dataEdit;

  final EditScreenController _editScreenController =
      Get.put(EditScreenController());
  final SignUpController _signUpController = Get.put(SignUpController());
  final _formkey = GlobalKey<FormState>();

  EditScreenView({this.dataEdit, this.editor});
  @override
  Widget build(BuildContext context) {
    _editScreenController.firstnameformController.text = dataEdit['Name'];
    _editScreenController.lastnameformController.text = dataEdit['age'];
    _editScreenController.numberEditimg.text = dataEdit['Number'];
    final dataq = dataEdit['image'];
    var images2 = Base64Decoder().convert(dataq);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(22, 186, 197, 1),
          title: Text('Edit-data'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Form(
                key: _formkey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: GetBuilder<EditScreenController>(builder: (cont) {
                        if (editor == true) {
                          _editScreenController.image = dataEdit['image'];
                          editor = false;
                        }
                        return CircleAvatar(
                          radius: 60,
                          backgroundImage: MemoryImage(Base64Decoder()
                              .convert(_editScreenController.image)),
                        );
                      }),
                    ),
                    IconButton(
                        onPressed: () async {
                          _editScreenController.picksimage();
                        },
                        icon: const Icon(Icons.add_a_photo)),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 20, right: 20),
                      child: TextFormField(
                        controller:
                            _editScreenController.firstnameformController,
                        decoration: const InputDecoration(
                          label: Text('Name'),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value!) ||
                              value.length < 3) {
                            return 'please enter valid username';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 20, right: 20),
                      child: TextFormField(
                        controller:
                            _editScreenController.lastnameformController,
                        decoration: const InputDecoration(
                          label: Text('Age'),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (RegExp(r'^[0-9][)]*$').hasMatch(value!) ||
                              value.length > 3 ||
                              value.isEmpty) {
                            return 'please enter valid Age';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 20, right: 20),
                      child: TextFormField(
                        controller: _editScreenController.numberEditimg,
                        decoration: const InputDecoration(
                          label: Text('Number'),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (!RegExp(r'^[0-9]{10}$').hasMatch(value!)) {
                            return 'please enter valid number';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(22, 186, 197, 1),
                              ),
                            ),
                            onPressed: () async {
                              _editScreenController.updateFunction(dataEdit);
                            },
                            child: const Text('Update-Data'),
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
