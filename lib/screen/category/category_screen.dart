import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../utils/constant.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreen();
}

class _CategoryScreen extends State<CategoryScreen> {
  var selectedName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 26, 24, 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create newcategory"),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 20),
                  child: Container(
                    width: 327,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Category name:"),
                        SizedBox(height: 16),
                        TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                                hintText: "Category name",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  1,
                                )))))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Category icon:"),
                        SizedBox(height: 16),
                        Container(
                            width: 154,
                            height: 37,
                            child: SingleChildScrollView(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: selectedName,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedName = value!;
                                  });
                                },
                                items: categoryList.map((item) {
                                  return DropdownMenuItem<String>(
                                      value: item['name'],
                                      child: Image.asset(
                                        item['image'],
                                      ));
                                }).toList(),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 325),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Categoy color"),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                            height: 36,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categoryList.length - 1,
                                itemBuilder: (BuildContext context, int index) {
                                  Color color = categoryList[index]['color'];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          categoryList.forEach((element) {
                                            element['selectedColor'] = false;
                                          });
                                        },
                                      );
                                      categoryList[index]['selectedColor'] =
                                          true;

                                      print(categoryList[index]['color']);
                                    },
                                    child: Container(
                                        width: 28,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(70),
                                          color: color,
                                        ),
                                        margin: EdgeInsets.all(4),
                                        child: categoryList[index]
                                                    ['selectedColor'] ==
                                                true
                                            ? Image.asset("images/tick.png")
                                            : null),
                                  );
                                }))
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 154,
                        height: 48,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)))),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Color.fromRGBO(134, 135, 231, 1)),
                          ),
                        ),
                      ),
                      Container(
                        width: 154,
                        height: 48,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(134, 135, 231, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4)))),
                            onPressed: () {},
                            child: Text("Create Category")),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
