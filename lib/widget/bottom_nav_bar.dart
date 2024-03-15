import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onPageChanged;
  final Function(int) onTapItem;
  final int currentIndex;
  BottomNavBar(
      {super.key,
      required this.onPageChanged,
      required this.onTapItem,
      required this.currentIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: BottomNavigationBar(
        currentIndex: 2,
        onTap: widget.onTapItem,
        backgroundColor: Color.fromRGBO(54, 54, 54, 1),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_outlined), label: "Focuse"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
