import 'package:flutter/material.dart';

import '../utils/constant.dart';

class CategoryItem {
  final int id;
  final String image;
  final String name;

  CategoryItem({required this.id, required this.image, required this.name});
}

class Category extends StatefulWidget {
  final Function handleCategoryName;
  const Category({super.key, required this.handleCategoryName});

  @override
  State<Category> createState() => _Category();
}

class _Category extends State<Category> {
  var selectedCategory;
  @override
  Widget build(BuildContext context) {
    List<Widget> categoryWidget = categoryList.map((item) {
      return GestureDetector(
        onTap: () {
          widget.handleCategoryName(item);
          print(item);
          setState(() {
            selectedCategory = item;
            item['name'] == "Create New"
                ? Navigator.pushNamed(context, "/category")
                : null;
          });
        },
        child: Column(
          children: [
            Card(
              color: item['color'],
              child: Container(
                width: 80,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item['image']),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 14),
              child: Text(item['name']),
            )
          ],
        ),
      );
    }).toList();

    // print(selectedCategory);

    return AlertDialog(
      title: Column(children: [Text("Choose Category"), Divider()]),
      content: Container(
        child: Wrap(
          children: categoryWidget,
        ),
      ),
      actions: [
        Container(
          width: 289,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(134, 135, 231, 1))),
            onPressed: () {
              print("heloo");
            },
            child: Text("Add Category"),
          ),
        )
      ],
    );
  }
}

void ShowCategory(
  BuildContext context,
  void Function(dynamic) handleCategoryName,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Category(handleCategoryName: handleCategoryName);
    },
  );
}
