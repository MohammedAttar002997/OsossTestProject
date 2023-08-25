import 'package:flutter/material.dart';

class ShapeButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape boxShape;
  final Color shapeColor;

  const ShapeButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.boxShape,
    required this.shapeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:  BoxDecoration(
        shape: boxShape,
        color: shapeColor,
      ),
    );
  }
}
