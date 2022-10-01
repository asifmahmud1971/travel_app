import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/Helper/common_widget.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 0.5),
            borderRadius: BorderRadius.circular(5)),
        width: Get.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.search,
                size: 25.r,
                color: Colors.lightBlueAccent,
              ),
            ),
            Expanded(
              child: setCommonText(
                  "Search your place", Colors.black, 12.sp, FontWeight.w100, 1),
            )
          ],
        ),
      ),
    );
  }
}
