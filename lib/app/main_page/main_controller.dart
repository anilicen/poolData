import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/navigator.dart';

class MainController extends Controller {
  @override
  void initListeners() {
    // TODO: implement initListeners
  }
  @override
  void onInitState() {
    // TODO: implement onInitState
    super.onInitState();
  }

  void navigateToMatchesView(BuildContext context) {
    PdNavigator.navigateToMatchesView(context);
  }

  void navigateToAddMatchView(BuildContext context) {
    PdNavigator.navigateToAddMatchView(context);
  }

  void navigateToShowPlayersView(BuildContext context) {
    PdNavigator.navigateToShowPlayers(context);
  }

  void navigateToScoreboardView(BuildContext context) {
    PdNavigator.navigateToScoreboardView(context);
  }
}
