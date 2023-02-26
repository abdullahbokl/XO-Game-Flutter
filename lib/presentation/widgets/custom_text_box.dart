import 'package:flutter/material.dart';
import 'package:xo/core/utils/app_colors.dart';
import 'package:xo/core/utils/app_dimensions.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    required this.text,
    this.bgColor,
    this.width,
    this.height,
    this.textColor,
  });

  final String text;
  final Color? bgColor;
  final Color? textColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.width10,
        vertical: AppDimensions.height10,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppDimensions.radius5),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? AppColors.primaryColor,
          fontSize: AppDimensions.font26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
