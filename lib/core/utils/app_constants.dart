import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/core/utils/app_dimensions.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:xo/presentation/widgets/big_text.dart';
import 'package:xo/business_logic/wins_counter_cubit/game_cubit.dart';

class AppConstants {

  /// Show snackbar
  static showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
            alignment: Alignment.center, child: BigText(text: message)),
        duration: const Duration(seconds: 1),
      ),
    );
  }


  /// Show dialog
  static AwesomeDialog showAwesomeDialog({
    required BuildContext context,
    required DialogType dialogType,
    required String dialogTitle,
    required String message,
    required Color titleColor,
    String? btnOkText,
    String? btnCancelText,
    VoidCallback? onTap,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.bottomSlide,
      title: dialogTitle,
      titleTextStyle: TextStyle(
          color: titleColor,
          fontWeight: FontWeight.bold,
          fontSize: AppDimensions.font20),
      desc: message,
      descTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppDimensions.font16,
          color: Colors.black.withOpacity(0.5)),
      btnOkOnPress: () {
        BlocProvider.of<GameCubit>(context).restartGame();
      },
      onDismissCallback: (type) => BlocProvider.of<GameCubit>(context)
          .restartGame(),
      btnCancelOnPress: onTap,
      btnOkText: btnOkText,
      btnCancelText: btnCancelText,
    )..show();
  }
}
