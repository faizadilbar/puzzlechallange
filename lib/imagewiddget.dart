import 'package:flutter/material.dart';

// ignore: must_be_immutable
class imageDisplay extends StatelessWidget {
  String imagePath;

  imageDisplay(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
