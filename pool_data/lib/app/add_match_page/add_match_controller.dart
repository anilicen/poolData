import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/domain/entities/match.dart' as pd;
import 'package:pool_data/domain/entities/user.dart';
import 'package:pool_data/domain/repositories/match_repository.dart';
import 'package:pool_data/domain/repositories/user_repository.dart';

class AddMatchController extends Controller {
  AddMatchController(MatchRepository matchRepository, UserRepository userRepository)
      : _matchRepository = matchRepository,
        _userRepository = userRepository;

  MatchRepository _matchRepository;
  UserRepository _userRepository;

  List<User>? userList;

  User? firstSelectedUser;
  User? secondSelectedUser;
  static User tempUser = User(id: '', username: '', matchWon: 0, matchLost: 0, rackWon: 0, rackLost: 0);
  pd.Match match = pd.Match(id: '', player1: tempUser, player2: tempUser, player1Score: 0, player2Score: 0, raceTo: 0);

  int? raceTo;
  int? firstPlayerScore;
  int? secondPlayerScore;

  bool isEnabled = false;
  bool isLoading = false;
  bool isError = false;
  @override
  Future<void> onInitState() async {
    // TODO: implement onInitState
    if (_userRepository.getUserList().isEmpty) {
      await _userRepository.getUsers();
    }
    userList = _userRepository.getUserList();
    refreshUI();
    super.onInitState();
  }

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void selectFirstUser(User user) {
    firstSelectedUser = user;
    refreshUI();
  }

  void selectSecondUser(User user) {
    secondSelectedUser = user;
    refreshUI();
  }

  void setRaceTo(String val) {
    if (val.isEmpty) {
      isEnabled = false;
      return;
    }
    raceTo = int.parse(val);
    isButtonActive();
    refreshUI();
  }

  void setFirstPlayerScore(String val) {
    if (val.isEmpty) {
      isEnabled = false;
      return;
    }
    firstPlayerScore = int.parse(val);
    isButtonActive();
    refreshUI();
  }

  void setSecondPlayerScore(String val) {
    if (val.isEmpty) {
      isEnabled = false;
      return;
    }
    secondPlayerScore = int.parse(val);
    isButtonActive();
    refreshUI();
  }

  void isButtonActive() {
    if (firstSelectedUser != null &&
        secondSelectedUser != null &&
        raceTo != null &&
        firstPlayerScore != null &&
        secondPlayerScore != null) {
      if (firstPlayerScore! > raceTo! || secondPlayerScore! > raceTo!) {
        isEnabled = false;
      } else if (firstPlayerScore! < raceTo! && secondPlayerScore! < raceTo!) {
        isEnabled = false;
      } else if (firstPlayerScore == secondPlayerScore) {
        isEnabled = false;
      } else {
        isEnabled = true;
      }
    } else {
      isEnabled = false;
    }
  }

  Future<void> addMatch(context) async {
    isLoading = true;
    refreshUI();
    match = match.copyWith(
      player1: firstSelectedUser,
      player1Score: firstPlayerScore,
      player2: secondSelectedUser,
      player2Score: secondPlayerScore,
      raceTo: raceTo,
    );

    await _matchRepository.addMatch(match.toJson());

    User player1 = match.player1;
    User player2 = match.player2;

    if (match.raceTo == match.player1Score) {
      await _userRepository.updateUser(
        player1.id,
        player1.matchWon + 1,
        player1.matchLost,
        player1.rackWon + match.player1Score,
        player1.rackLost + match.player2Score,
      );

      await _userRepository.updateUser(
        player2.id,
        player2.matchWon,
        player2.matchLost + 1,
        player2.rackWon + match.player2Score,
        player2.rackLost + match.player1Score,
      );
    } else {
      await _userRepository.updateUser(
        player1.id,
        player1.matchWon,
        player1.matchLost + 1,
        player1.rackWon + match.player1Score,
        player1.rackLost + match.player2Score,
      );

      await _userRepository.updateUser(
        player2.id,
        player2.matchWon + 1,
        player2.matchLost,
        player2.rackWon + match.player2Score,
        player2.rackLost + match.player1Score,
      );
    }
    Navigator.pop(context);
  }
}
