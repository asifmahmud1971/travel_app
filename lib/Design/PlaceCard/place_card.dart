import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/Helper/app_spacer.dart';
import 'package:travel_app/Helper/common_widget.dart';

class PlaceCard extends StatefulWidget {
  final VoidCallback? ontap;
  final String? title;
  final String? location;
  final String? date;
  final String? banner;
  final String? code;

  const PlaceCard(
      {Key? key,
      this.ontap,
      this.title,
      this.location,
      this.date,
      this.banner,
      this.code})
      : super(key: key);

  @override
  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.w),
                    child: Container(
                      width: Get.width / 1.8,
                      height: Get.width / 2.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(widget.banner!))),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.banner!.toString(),
                        placeholder: (context, url) => Container(
                          alignment: Alignment.center,
                          height: 50.h,
                          width: 50.h,
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.blue,
                            size: 50,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/image/empty.jpg"),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 25,
                      child: InkWell(
                        onTap: widget.ontap,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.5),
                                spreadRadius: 0.7,
                                blurRadius: 0.7,
                                // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.r),
                            child: const Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Container(
                width: Get.width / 1.8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      setCommonText(widget.title!, Colors.black, 15.sp,
                          FontWeight.w600, 2),
                      setCommonText(widget.location!, Colors.black, 14.sp,
                          FontWeight.w200, 2),
                      AppSpaces.spaces_height_5,
                      Container(
                        width: Get.width,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              width: Get.width,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                      size: 12.sp,
                                    ),
                                  ),
                                  Expanded(
                                    child: setCommonText(
                                        widget.date!,
                                        Colors.black,
                                        12.sp,
                                        FontWeight.w100,
                                        2),
                                  )
                                ],
                              ),
                            )),
                            Row(
                              children: [
                                setCommonText(widget.code!, Colors.lightBlue,
                                    12.sp, FontWeight.w100, 2),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
