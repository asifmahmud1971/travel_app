import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/Controller/base_controller.dart';

class GetData extends ChangeNotifier with BaseController {
  List? products = [];
  var firestore = FirebaseFirestore.instance;

  Future getPlace() async {
    QuerySnapshot qn = await firestore.collection("travel").get();
    for (int i = 0; i < qn.docs.length; i++) {
      products!.add({
        "name": qn.docs[i]["name"],
        "location": qn.docs[i]["location"],
        "description": qn.docs[i]["description"],
        "date": qn.docs[i]["date"],
        "code": qn.docs[i]["code"],
        "banner": qn.docs[i]["banner"],
      });
    }
    printInfo(info: products!.length.toString());
    notifyListeners();
  }
}
