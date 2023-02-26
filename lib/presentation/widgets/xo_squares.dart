import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/core/utils/app_dimensions.dart';
import 'package:xo/presentation/widgets/square_card.dart';
import 'package:xo/business_logic/wins_counter_cubit/game_cubit.dart';

class XOSquares extends StatelessWidget {
  const XOSquares({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.width5,
        vertical: AppDimensions.height5,
      ),
      child: BlocBuilder<GameCubit, GameStates>(
        builder: (context, state) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: AppDimensions.width10,
              mainAxisSpacing: AppDimensions.height10,
              childAspectRatio: 0.85,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<GameCubit>(context).changeCurrentPlayerRole(index);
                },
                child: SquareCard(
                  card: BlocProvider.of<GameCubit>(context).cards[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
