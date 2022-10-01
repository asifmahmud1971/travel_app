import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/Controller/get_data.dart';
import 'package:travel_app/Design/Search/search_box.dart';
import 'package:travel_app/Helper/common_widget.dart';
import 'package:travel_app/Page/Category/category_list.dart';

import 'PlaceList/place_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var fetchData;

  @override
  void initState() {
    fetchData = Provider.of<GetData>(context, listen: false);
    fetchData.getPlace();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        elevation: 0,
        backgroundColor: Colors.white,
        title:
            setCommonText("Traveler", Colors.black, 20.sp, FontWeight.w600, 1),
      ),
      body: Consumer<GetData>(builder: (context, data, child) {
        return data.products != null
            ? SizedBox(
                height: Get.height,
                width: Get.width,
                child: ListView(
                  children: [
                    const SearchBox(),
                    10.verticalSpace,
                    const CategoryList(),
                    const PlaceList(tittle: "Popular"),
                    const PlaceList(tittle: "Recommended"),
                  ],
                ),
              )
            : Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.blue,
                  size: 50,
                ),
              );
      }),
    );
  }
}
