import 'package:flutter/material.dart';

class Skip extends StatelessWidget {
  final String skip;
  Skip({Key? key, required this.skip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, skip);
        },
        child: Text(
          "SKIP",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
