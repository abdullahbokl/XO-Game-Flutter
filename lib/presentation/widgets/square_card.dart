import 'package:flutter/material.dart';
import 'package:xo/data/models/card_model.dart';
import 'package:xo/presentation/widgets/custom_text_box.dart';

class SquareCard extends StatelessWidget {
  const SquareCard({Key? key, required this.card}) : super(key: key);

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return CustomTextBox(
      text: card.selectedBy!,
      textColor: Colors.white,
      bgColor: card.color,
    );

  }
}
