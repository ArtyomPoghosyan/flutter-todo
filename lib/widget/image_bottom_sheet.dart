import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? image;

Future<void> handlePickImage(source) async {
  try {
    final imageFile = await ImagePicker().pickImage(source: source);
    if (imageFile == null) return;
    final imageTemporary = File(imageFile.path);
    print(imageTemporary);
    image = imageTemporary;
  } catch (e) {
    print(e);
  }
}

Future DisplayBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    context: context,
    builder: (context) => Container(
      height: 246,
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 15, 32, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "Change account Image",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 255, 255, 0.87)),
                  )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
                    child: Divider(),
                  ),
                  InkWell(
                    onTap: () {
                      // UploadImage();
                      handlePickImage(ImageSource.camera);
                    },
                    child: Text(
                      "Take picture",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.87)),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      handlePickImage(ImageSource.gallery);
                    },
                    child: Text(
                      "Import from gallery",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.87)),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      handlePickImage(ImageSource.gallery);
                    },
                    child: Text(
                      "Import from Google Drive",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.87)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
