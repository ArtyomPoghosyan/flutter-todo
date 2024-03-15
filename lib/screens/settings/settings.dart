import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(255, 255, 255, 0.87)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 19, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "settings",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(175, 175, 175, 1)),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.brush,
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                          ),
                          Text(
                            "Change app color",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.87),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      child: InkWell(
                        onTap: () {
                          print("password");
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 204,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.title_rounded,
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                          ),
                          Text(
                            "Change app typography",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.87),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      child: InkWell(
                        onTap: () {
                          print("password");
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 190,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "images/language.png",
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                          ),
                          const Text(
                            "Change app language",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.87),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      child: InkWell(
                        onTap: () {
                          print("password");
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 33),
                const Text("Import",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(175, 175, 175, 1))),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 244,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "images/import.png",
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                          ),
                          const Text(
                            "Import from Google calendar",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.87),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      child: InkWell(
                        onTap: () {
                          print("password");
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
