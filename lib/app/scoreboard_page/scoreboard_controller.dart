import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/data/repositories/match_repository.dart';
import 'package:pool_data/data/repositories/user_repository.dart';

class ScoreboardController extends Controller {
  ScoreboardController();

  int player1Score = 0;
  int player2Score = 0;

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void increasePlayer1Score() {
    player1Score++;
    refreshUI();
  }

  void decreasePlayer1Score() {
    player1Score--;
    refreshUI();
  }

  void increasePlayer2Score() {
    player2Score++;
    refreshUI();
  }

  void decreasePlayer2Score() {
    player2Score--;
    refreshUI();
  }
}
