import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/business_logic/wins_counter_cubit/game_cubit.dart';
import 'package:xo/core/utils/app_colors.dart';
import 'package:xo/core/utils/app_dimensions.dart';
import 'package:xo/presentation/widgets/custom_text_box.dart';

class CurrentPlayer extends StatelessWidget {
  const CurrentPlayer({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    GameCubit cubit =
        BlocProvider.of<GameCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: CustomTextBox(
            text: 'Current player',
            bgColor: AppColors.secondaryColor,
            height: AppDimensions.height60,
            textColor: Colors.black,
          ),
        ),
        SizedBox(width: AppDimensions.width20),
        // current player
        Expanded(
          flex: 1,
          child: BlocBuilder<GameCubit, GameStates>(
            builder: (context, state) {
              return CustomTextBox(
                text: cubit.currentPlayerRoleCounter.isEven ? 'X' : 'O',
                textColor: AppColors.primaryColor,
                bgColor: AppColors.secondaryColor,
                height: AppDimensions.height55,
              );
            },
          ),
        ),
      ],
    );
  }
}
