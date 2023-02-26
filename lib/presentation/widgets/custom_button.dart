import 'package:flutter/material.dart';
import 'package:xo/core/utils/app_colors.dart';
import 'package:xo/core/utils/app_dimensions.dart';
import 'package:xo/presentation/widgets/big_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: AppDimensions.height70,
        width: AppDimensions.width200,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius10),
        ),
        child: const BigText(
          text: 'Restart',
          color: Colors.white,
        ),
      ),
    );
  }
}
