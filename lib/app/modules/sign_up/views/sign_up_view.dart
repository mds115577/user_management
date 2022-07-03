import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Create Account',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromRGBO(22, 186, 197, 1),
        ),
        body: ListView(
          children: [
            Form(
              key: _signUpController.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Column(
                      children: [
                        GetBuilder<SignUpController>(builder: (context) {
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(60),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'android/assets/images/avatar.png'),
                              ),
                            ),
                            child: _signUpController.img.trim().isNotEmpty
                                ? CircleAvatar(
                                    backgroundImage: MemoryImage(
                                      const Base64Decoder()
                                          .convert(_signUpController.img),
                                    ),
                                  )
                                : Container(),
                          );
                        }),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        _signUpController.pickimage();
                      },
                      icon: const Icon(Icons.add_a_photo)),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 20),
                    child: Container(
                      child: (TextFormField(
                        controller:
                            _signUpController.firstNameEditingController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.abc,
                              color: Color.fromRGBO(22, 186, 197, 1),
                            ),
                            hintText: 'Enter Your Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                        validator: (value) {
                          if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value!) ||
                              value.length < 3) {
                            return 'please enter valid Name';
                          } else {
                            return null;
                          }
                        },
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 20),
                    child: Container(
                      child: (TextFormField(
                        controller: _signUpController.ageediting,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.numbers,
                              color: Color.fromRGBO(22, 186, 197, 1),
                            ),
                            hintText: 'age',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                        validator: (value) {
                          if (RegExp(r'^[0-9][)]*$').hasMatch(value!) ||
                              value.length > 3 ||
                              value.isEmpty) {
                            return 'please enter valid Age';
                          } else {
                            return null;
                          }
                        },
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 20),
                    child: Container(
                      child: (TextFormField(
                        maxLength: 10,
                        controller: _signUpController.numberController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Color.fromRGBO(22, 186, 197, 1),
                            ),
                            hintText: 'Mobile Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                        validator: (value) {
                          if (!RegExp(r'^[0-9]{10}$').hasMatch(value!)) {
                            return 'please enter valid number';
                          } else {
                            return null;
                          }
                        },
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 15),
                    child: Container(
                      child: (TextFormField(
                        controller: _signUpController.emailEditingController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color.fromRGBO(22, 186, 197, 1),
                            ),
                            hintText: 'Enter your  e-mail',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                        validator: (value) {
                          if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                                  .hasMatch(value!) ||
                              value.length < 3) {
                            return 'please enter valid email';
                          } else {
                            return null;
                          }
                        },
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 25),
                    child: Container(
                      child: (TextFormField(
                        controller: _signUpController.passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Color.fromRGBO(22, 186, 197, 1),
                            ),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                      )),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(22, 186, 197, 1),
                      ),
                    ),
                    onPressed: () async {
                      await _signUpController.signUp(
                          _signUpController.emailEditingController.text,
                          _signUpController.passwordController.text);
                    },
                    child: const Text('Sign-up'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
