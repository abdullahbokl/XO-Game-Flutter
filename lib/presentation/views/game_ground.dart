import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/core/utils/app_constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:xo/presentation/widgets/xo_squares.dart';
import 'package:xo/presentation/widgets/custom_button.dart';
import 'package:xo/presentation/widgets/current_player.dart';
import 'package:xo/business_logic/wins_counter_cubit/game_cubit.dart';

class GameGround extends StatelessWidget {
  const GameGround({Key? key}) : super(key: key);

  final int outSpaceFlex = 3;
  final int inSpaceFlex = 4;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameCubit, GameStates>(
      listener: (context, state) {
        _checkState(state, context);
      },
      child: Column(
        children: [
          Spacer(flex: outSpaceFlex),
          // current player
          const CurrentPlayer(),

          Spacer(flex: inSpaceFlex),

          // game ground
          const XOSquares(),
          Spacer(flex: inSpaceFlex),

          // restart button
          CustomButton(onTap: () => _restartOrReset(context)),
          Spacer(flex: outSpaceFlex),
        ],
      ),
    );
  }

  // check the state of the game
  _checkState(GameStates state, BuildContext context) {
    if (state is AlreadySelected) {
      // show snack-bar if the card is already selected
      AppConstants.showSnackBar(context: context, message: 'Already selected');
    } else if (state is PlayerWins) {
      // show dialog if a player wins
      AppConstants.showAwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        dialogTitle: 'Congratulations',
        message: 'The winner is player ${state.player}',
        titleColor: Colors.green,
      );
    } else if (state is GameIsDraw) {
      // show dialog if the game is draw
      AppConstants.showAwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        dialogTitle: 'Game Draw',
        message: 'No one wins',
        titleColor: Colors.red,
      );
    }
  }

  // restart or reset the game
  void _restartOrReset(BuildContext context) {
    AppConstants.showAwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      dialogTitle: 'Restart Or Reset',
      message: 'Do you want to restart the match or reset the game?',
      titleColor: Colors.blue,
      btnOkText: 'Restart',
      onTap: () {
        BlocProvider.of<GameCubit>(context).resetGame();
      },
      btnCancelText: 'Reset',
    );
  }
}
