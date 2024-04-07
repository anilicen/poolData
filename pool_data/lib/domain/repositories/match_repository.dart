abstract class MatchRepository {
  Future<void> addMatch(Map<String, dynamic> json);
  Future<void> getMatches();
}
