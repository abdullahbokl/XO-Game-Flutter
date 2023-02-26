import 'package:flutter/material.dart';
import 'package:xo/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/core/utils/app_dimensions.dart';
import 'package:xo/presentation/widgets/big_text.dart';
import 'package:xo/presentation/widgets/wins_counter_text.dart';
import 'package:xo/business_logic/wins_counter_cubit/game_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GameCubit cubit = BlocProvider.of<GameCubit>(context);
    return Container(
      height: AppDimensions.height70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDimensions.radius20),
        ),
      ),
      child: BlocBuilder<GameCubit, GameStates>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // X player winds counter
              WinsCounterText(numberOfGoals: cubit.playerXCounter),
              SizedBox(width: AppDimensions.width10),
              const BigText(
                text: "X - O",
                color: Colors.white,
              ),
              SizedBox(width: AppDimensions.width10),
              // O player winds counter
              WinsCounterText(numberOfGoals: cubit.playerOCounter),
            ],
          );
        },
      ),
    );
  }
}
