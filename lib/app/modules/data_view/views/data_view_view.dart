import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../single_page_view/views/single_page_view_view.dart';
import '../controllers/data_view_controller.dart';

class DataViewView extends GetView<DataViewController> {
  final DataViewController _dataViewController = Get.put(DataViewController());

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(22, 186, 197, 1),
        appBar: AppBar(
          title: Center(child: Text('${user!.email}')),
          actions: [
            IconButton(
                onPressed: () async {
                  await _dataViewController.logout();
                },
                icon: Icon(Icons.exit_to_app))
          ],
          backgroundColor: const Color.fromRGBO(22, 186, 197, 1),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("newdata").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final List usersData = [];
            snapshot.data!.docs.map((DocumentSnapshot document) {
              Map a = document.data() as Map<String, dynamic>;
              usersData.add(a);
              a["uid"] = document.id;
            }).toList();

            return ListView.separated(
                itemBuilder: (context, index) {
                  final datas = usersData[index];

                  final dataimage = usersData[index]['image'];
                  var images = Base64Decoder().convert(dataimage);
                  return Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 8, right: 8),
                    child: Container(
                      height: 80,
                      child: Card(
                          color: Color.fromARGB(120, 73, 118, 114),
                          child: ListTile(
                            onTap: () {
                              Get.to(SinglePageViewView(
                                datas: datas,
                              ));
                            },
                            leading: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: CircleAvatar(
                                backgroundImage: MemoryImage(images),
                                radius: 30,
                              ),
                            ),
                            title: Text(
                              usersData[index]['Name'],
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.7),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Age:-${datas['age']}',
                              style: TextStyle(color: Colors.amber),
                            ),
                          )),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: usersData.length);
          },
        ),
      ),
    );
  }
}
