import 'bloc_observer.dart';
import 'package:xo/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
