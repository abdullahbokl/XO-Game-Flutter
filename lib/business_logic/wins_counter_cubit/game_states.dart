part of 'game_cubit.dart';

@immutable
abstract class GameStates {}

class WinsCounterInitial extends GameStates {}

class CardSelected extends GameStates {}

class AlreadySelected extends GameStates {}

class PlayerWins extends GameStates {
  final String player;
  PlayerWins({required this.player});
}

class GameIsDraw extends GameStates {}