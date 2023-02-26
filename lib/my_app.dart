import 'package:flutter/material.dart';
import 'presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/business_logic/wins_counter_cubit/game_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
