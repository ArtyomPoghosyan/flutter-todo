import 'package:flutter/material.dart';

class ThreeLines extends StatelessWidget {
  const ThreeLines({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 95,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  color: Colors.white,
                ),
                width: 26,
                height: 4,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  color: Color.fromRGBO(175, 175, 175, 1),
                ),
                width: 26,
                height: 4,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  color: Color.fromRGBO(175, 175, 175, 1),
                ),
                width: 26,
                height: 4,
              )
            ],
          ),
        )
      ],
    );
  }
}
