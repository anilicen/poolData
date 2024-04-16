import 'package:pool_data/domain/entities/match.dart';
import 'package:pool_data/domain/repositories/match_repository.dart';
import 'package:pool_data/request.dart';

class DataMatchRepository implements MatchRepository {
  static final _instance = DataMatchRepository._internal();
  DataMatchRepository._internal();
  factory DataMatchRepository() => _instance;

  List<Match> matchList = [];

  @override
  Future<void> addMatch(Match match) async {
    await Request.addMatch(match.toJson());
    if (matchList.isNotEmpty) matchList.add(match);
  }

  @override
  Future<void> getMatches() async {
    await Request.getMatches(matchList);
  }

  @override
  List<Match> getMatchList() {
    return matchList;
  }
}
