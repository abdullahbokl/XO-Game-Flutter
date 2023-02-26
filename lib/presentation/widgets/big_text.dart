import 'package:flutter/material.dart';
import 'package:xo/core/utils/app_dimensions.dart';

class BigText extends StatelessWidget {
  const BigText({Key? key, required this.text, this.color}) : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: AppDimensions.font26,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
