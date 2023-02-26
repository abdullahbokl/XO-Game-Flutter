import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:xo/core/utils/app_colors.dart';

class CardModel extends Equatable {
  CardModel({
    this.color = AppColors.secondaryColor,
    this.selectedBy = '',
  });

  Color? color;
  String? selectedBy;

  @override
  List<Object?> get props => [
        color,
        selectedBy,
      ];
}
