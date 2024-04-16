import 'package:pool_data/domain/entities/match.dart' as pd;

abstract class MatchRepository {
  Future<void> addMatch(pd.Match match);
  Future<void> getMatches();
  List<pd.Match> getMatchList();
}
