import 'package:flutter/material.dart';
import 'package:xo/core/utils/app_colors.dart';
import 'package:xo/core/utils/app_dimensions.dart';

class WinsCounterText extends StatefulWidget {
  const WinsCounterText({
    super.key,
    required this.numberOfGoals,
  });

  final int numberOfGoals;

  @override
  State<WinsCounterText> createState() => _WinsCounterTextState();
}

class _WinsCounterTextState extends State<WinsCounterText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: AppDimensions.height50,
      width: AppDimensions.width50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius10),
      ),
      child: Text(
        widget.numberOfGoals.toString(),
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: AppDimensions.font24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
