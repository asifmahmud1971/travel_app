import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/Design/Description/day_image.dart';
import 'package:travel_app/Helper/UI%20Helper/size_config.dart';
import 'package:travel_app/Helper/app_spacer.dart';
import 'package:travel_app/Helper/common_widget.dart';

class Description extends StatefulWidget {
  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final double expandedHeight = 300;

  final double roundedContainerHeight = 30;

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            _buildSilverHead(),
            SliverToBoxAdapter(
              child: _buildDetail(),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, right: 15, left: 15),
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.white)),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildSilverHead() {
    return SliverPersistentHeader(
        delegate: DetailSliverDelegate(
      data["banner"],
      expandedHeight: expandedHeight,
      roundedContainerHeight: roundedContainerHeight,
    ));
  }

  Widget _buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              data['description'].toString(),
              style: const TextStyle(
                  color: Colors.grey, fontSize: 16, height: 1.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                setCommonText("Program", Colors.black,
                    1.8 * SizeConfig.textMultiplier, FontWeight.w600, 1),
                setCommonText("Dag 1 av 4", Colors.blue,
                    1.4 * SizeConfig.textMultiplier, FontWeight.w200, 1),
              ],
            ),
          ),
          SizedBox(child: FeaturedWidget()),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                      size: 5 * SizeConfig.imageSizeMultiplier,
                    ),
                  ),
                  setCommonText("06/06/2021-15/06/2021", Colors.black,
                      1.8 * SizeConfig.textMultiplier, FontWeight.w200, 1),
                ],
              ),
              AppSpaces.spaces_height_10,
              Text(
                data["name"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                data["location"],
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double roundedContainerHeight;
  final String image;

  DetailSliverDelegate(this.image,
      {required this.expandedHeight, required this.roundedContainerHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.network(image,
              width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover),
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
        ),
        /* Positioned(
            top: expandedHeight - shrinkOffset - 120,
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Agra Tajmahal",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                Text(
                  "India",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ))*/
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
