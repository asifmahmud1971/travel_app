import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/Controller/get_data.dart';
import 'package:travel_app/Design/PlaceCard/place_card.dart';
import 'package:travel_app/Helper/common_widget.dart';
import 'package:travel_app/Page/PlaceList/description.dart';

class PlaceList extends StatefulWidget {
  final String? tittle;
  const PlaceList({Key? key, this.tittle}) : super(key: key);

  @override
  _PlaceListState createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetData>(builder: (context, data, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
        child: Container(
          width: Get.width,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: setCommonText(widget.tittle!, Colors.black, 16.sp,
                        FontWeight.w500, 1),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      onPressed: () {},
                      label: setCommonText("See All", Colors.lightBlueAccent,
                          14.sp, FontWeight.w300, 1),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.lightBlueAccent,
                        size: 14.r,
                      ),
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(
                      data.products!.length,
                      (index) => PlaceCard(
                            title: data.products![index]["name"],
                            location: data.products![index]["location"],
                            date: data.products![index]["date"],
                            code: data.products![index]["code"],
                            banner: data.products![index]["banner"],
                            ontap: () {
                              Get.to(Description(),
                                  arguments: data.products![index]);
                            },
                          )),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
