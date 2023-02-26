import 'package:flutter/material.dart';
import 'package:xo/core/utils/app_dimensions.dart';
import 'package:xo/presentation/views/game_ground.dart';
import 'package:xo/presentation/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // save the height and width of the screen
    AppDimensions.height = MediaQuery.of(context).size.height;
    AppDimensions.width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomAppBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.height20),
                child: const GameGround(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
