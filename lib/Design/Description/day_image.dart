import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedWidget extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10, top: 10, bottom: 10),
      child: Container(
        width: Get.width / 1.2,
        height: Get.width / 2.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/image/taj2.webp"))),
      ),
    );
  }
}
