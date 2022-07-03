import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:user_management/app/modules/data_view/views/data_view_view.dart';
import 'package:user_management/app/modules/sign_up/views/sign_up_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final HomeController _homeController = Get.put(HomeController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("User's App")),
          backgroundColor: const Color.fromRGBO(22, 186, 197, 1),
        ),
        body: ListView(
          children: [
            SizedBox(
              width: 400,
              height: 300,
              child: Center(
                child: Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_mr1olA.json'),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 25),
                    child: Container(
                      child: (TextFormField(
                        controller: _emailcontroller,
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
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Container(
                      child: (TextFormField(
                        controller: _passwordcontroller,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.to(SignUpView());
                          },
                          child: const Text('Dont have an account?'))
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(22, 186, 197, 1),
                      ),
                    ),
                    onPressed: () async {
                      User? user = await _homeController.loginFunct(
                          email: _emailcontroller.text,
                          password: _passwordcontroller.text,
                          BuildContext: context);
                      if (user != null) {
                        Get.off(DataViewView());
                      }
                    },
                    child: const Text('Login'),
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
