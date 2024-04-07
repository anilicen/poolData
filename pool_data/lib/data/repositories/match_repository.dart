import 'package:pool_data/domain/entities/match.dart' as pd;
import 'package:pool_data/domain/repositories/match_repository.dart';
import 'package:pool_data/request.dart';

class DataMatchRepository implements MatchRepository {
  List<pd.Match> matchList = [];

  @override
  Future<void> addMatch(Map<String, dynamic> json) async {
    await Request.addMatch(json);
  }

  @override
  Future<void> getMatches() async {
    await Request.getMatches(matchList);
  }

  List<pd.Match> getMatchList() {
    return matchList;
  }
}
