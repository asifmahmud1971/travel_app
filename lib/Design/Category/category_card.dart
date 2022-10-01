import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/Helper/common_widget.dart';

class CategoryCard extends StatefulWidget {
  final Color? color;
  final String? title;
  final IconData? iconData;

  const CategoryCard({Key? key, this.color, this.title, this.iconData})
      : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 50.w,
            width: 50.w,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: widget.color),
            child: Icon(
              widget.iconData,
              color: Colors.white,
            ),
          ),
          5.verticalSpace,
          setCommonText(widget.title!, Colors.black, 14.sp, FontWeight.w400, 1)
        ],
      ),
    );
  }
}
