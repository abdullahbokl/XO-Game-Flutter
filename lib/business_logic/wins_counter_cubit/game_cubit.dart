import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xo/core/utils/app_colors.dart';
import 'package:xo/data/models/card_model.dart';

part 'game_states.dart';

class GameCubit extends Cubit<GameStates> {
  GameCubit() : super(WinsCounterInitial());

  /// data

  int playerXCounter = 0;
  int playerOCounter = 0;
  int currentPlayerRoleCounter = 0;

  List<CardModel> cards = [
    CardModel(),
    CardModel(),
    CardModel(),
    CardModel(),
    CardModel(),
    CardModel(),
    CardModel(),
    CardModel(),
    CardModel(),
  ];

  /// functions

  /// select a card and change the role of the current player
  changeCurrentPlayerRole(int idx) {
    // check if the card is selected or not
    if (_checkIfSelected(idx)) {
      emit(AlreadySelected());
      return;
    }

    // if even then current is X role
    bool role = currentPlayerRoleCounter.isEven;

    _checkEvenOrOdd(idx: idx, role: role);

    // change the role of the current player
    currentPlayerRoleCounter++;
    emit(CardSelected());

    // after selecting the card check if the player wins or not
    _checkGameState(role);
  }

  _checkEvenOrOdd({required int idx, required bool role}) {
    if (role) {
      // X role
      cards[idx].selectedBy = 'X';
      cards[idx].color = AppColors.xColor;
    } else {
      // O role
      cards[idx].selectedBy = 'O';
      cards[idx].color = AppColors.oColor;
    }
  }

  _checkGameState(role) {
    /// check if the player wins or not
    if (_checkIfPlayerWins()) {
      if (role) {
        playerXCounter++;
        emit(PlayerWins(player: 'X'));
      } else {
        playerOCounter++;
        emit(PlayerWins(player: 'O'));
      }
    } else

    /// check if the game is draw or not
    if (checkIfGameIsDraw()) {
      emit(GameIsDraw());
    }
  }

  /// restart the game
  restartGame() {
    cards = [
      CardModel(),
      CardModel(),
      CardModel(),
      CardModel(),
      CardModel(),
      CardModel(),
      CardModel(),
      CardModel(),
      CardModel(),
    ];
    currentPlayerRoleCounter = 0;
    emit(WinsCounterInitial());
  }

  /// reset the game
  resetGame() {
    playerXCounter = 0;
    playerOCounter = 0;
    restartGame();
  }

  /// check if the card is selected or not
  bool _checkIfSelected(int idx) {
    return cards[idx].selectedBy?.isNotEmpty ?? false;
  }

  /// check if the game is draw or not
  bool checkIfGameIsDraw() {
    for (var i = 0; i < cards.length; i++) {
      print("index: $i    >>  ${cards[i].selectedBy}");
      if (cards[i].selectedBy!.isEmpty) {
        return false;
      }
    }
    for (var card in cards) {
      if (card.selectedBy!.isEmpty) {
        return false;
      }
    }
    return true;
  }

  /// check if the player wins or not
  bool _checkIfPlayerWins() {
    // check if the player wins horizontally
    if (_checkIfPlayerWinsHorizontally() ||
        _checkIfPlayerWinsVertically() ||
        _checkIfPlayerWinsDiagonally()) {
      return true;
    }
    return false;
  }

  // check if the player wins horizontally
  bool _checkIfPlayerWinsHorizontally() {
    // check if the player wins horizontally
    if ((cards[0] == cards[1] &&
            cards[1] == cards[2] &&
            cards[1].selectedBy!.isNotEmpty) ||
        (cards[3] == cards[4] &&
            cards[4] == cards[5] &&
            cards[4].selectedBy!.isNotEmpty) ||
        (cards[6] == cards[7] &&
            cards[7] == cards[8] &&
            cards[7].selectedBy!.isNotEmpty)) {
      return true;
    }
    return false;
  }

  // check if the player wins vertically
  bool _checkIfPlayerWinsVertically() {
    // check if the player wins vertically
    if ((cards[0] == cards[3] &&
            cards[3] == cards[6] &&
            cards[3].selectedBy!.isNotEmpty) ||
        (cards[1] == cards[4] &&
            cards[4] == cards[7] &&
            cards[4].selectedBy!.isNotEmpty) ||
        (cards[2] == cards[5] &&
            cards[5] == cards[8] &&
            cards[5].selectedBy!.isNotEmpty)) {
      return true;
    }
    return false;
  }

  // check if the player wins diagonally
  bool _checkIfPlayerWinsDiagonally() {
    // check if the player wins diagonally
    if ((cards[0] == cards[4] &&
            cards[4] == cards[8] &&
            cards[4].selectedBy!.isNotEmpty) ||
        (cards[2] == cards[4] &&
            cards[4] == cards[6] &&
            cards[4].selectedBy!.isNotEmpty)) {
      return true;
    }
    return false;
  }
}
