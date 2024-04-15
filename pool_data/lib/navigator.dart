import 'package:flutter/cupertino.dart';
import 'package:pool_data/app/add_match_page/add_match_view.dart';
import 'package:pool_data/app/matches_page/matches_view.dart';
import 'package:pool_data/app/scoreboard_page/scoreboard_view.dart';
import 'package:pool_data/app/show_players_page/show_players_view.dart';

class PdNavigator {
  static Future<void> navigateToMatchesView(BuildContext context) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => MatchesView()),
    );
  }

  static Future<void> navigateToAddMatchView(BuildContext context) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => AddMatchView()),
    );
  }

  static Future<void> navigateToShowPlayers(BuildContext context) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => ShowPlayersView()),
    );
  }

  static Future<void> navigateToScoreboardView(BuildContext context) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => ScoreboardView()),
    );
  }
}
