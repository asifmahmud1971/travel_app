import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/Design/Category/category_card.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(
        children: const [
          Expanded(
              child: Center(
            child: CategoryCard(
              color: Colors.teal,
              iconData: Icons.category,
              title: "All",
            ),
          )),
          Expanded(
              child: Center(
            child: CategoryCard(
              color: Colors.green,
              iconData: Icons.downhill_skiing,
              title: "Hill",
            ),
          )),
          Expanded(
              child: Center(
            child: CategoryCard(
              color: Colors.blueAccent,
              iconData: Icons.beach_access,
              title: "Beach",
            ),
          )),
          Expanded(
              child: Center(
            child: CategoryCard(
              color: Colors.amber,
              iconData: Icons.history_edu,
              title: "Historical",
            ),
          )),
        ],
      ),
    );
  }
}
