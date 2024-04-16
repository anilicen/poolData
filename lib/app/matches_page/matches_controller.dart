import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/domain/entities/match.dart';
import 'package:pool_data/domain/entities/user.dart';
import 'package:pool_data/domain/repositories/match_repository.dart';
import 'package:pool_data/request.dart';

class MatchesController extends Controller {
  MatchesController(MatchRepository matchRepository) : _matchRepository = matchRepository;
  @override
  void initListeners() {
    // TODO: implement initListeners
  }
  MatchRepository _matchRepository;
  List<Match>? matchList;
  @override
  Future<void> onInitState() async {
    print(_matchRepository.getMatchList());
    if (_matchRepository.getMatchList().isEmpty) await _matchRepository.getMatches();
    matchList = _matchRepository.getMatchList();
    refreshUI();
    super.onInitState();
  }

  User user1 = User(id: '', username: "FirstUser", matchWon: 0, matchLost: 0, rackWon: 0, rackLost: 0);
  User user2 = User(id: '', username: "SecondUser", matchWon: 0, matchLost: 0, rackWon: 0, rackLost: 0);
  Future<void> addUser() async {
    await Request.addUser(user1.toJson());
    await Request.addUser(user2.toJson());
  }

  Future<void> addMatch() async {
    Match match = Match(id: '', player1: user1, player2: user2, player1Score: 1, player2Score: 6, raceTo: 6);
    await Request.addMatch(match.toJson());
  }
}
