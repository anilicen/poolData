import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/app/matches_page/matches_controller.dart';
import 'package:pool_data/constants.dart';
import 'package:pool_data/data/repositories/match_repository.dart';
import 'package:pool_data/domain/entities/match.dart' as pd;
import 'package:pool_data/widgets/pd_title.dart';

// ignore: must_be_immutable
class MatchesView extends View {
  MatchesView({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _MatchesViewState(
      MatchesController(
        DataMatchRepository(),
      ),
    );
  }
}

class _MatchesViewState extends ViewState<MatchesView, MatchesController> {
  _MatchesViewState(MatchesController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ControlledWidgetBuilder<MatchesController>(
          builder: (context, controller) {
            return Column(
              children: [
                Container(
                  height: padding.top,
                  color: kTitleBackgroundColor,
                ),
                PdTitle(size: size, text: 'Matches'),
                controller.matchList == null
                    ? Container(alignment: Alignment.center, child: const CircularProgressIndicator())
                    : Expanded(
                        child: Container(
                          width: size.width,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(bottom: 30),
                            physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics(),
                            ),
                            child: Column(
                              children: [
                                for (pd.Match match in controller.matchList!.reversed)
                                  _MatchContainer(size: size, match: match)
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _MatchContainer extends StatelessWidget {
  const _MatchContainer({
    super.key,
    required this.size,
    required this.match,
  });

  final Size size;
  final pd.Match match;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: size.width,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: kWhite),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(
              match.player1.username,
              style: const TextStyle(
                color: kWhite,
                fontSize: 18,
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                match.player1Score.toString(),
                style: const TextStyle(
                  color: kWhite,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "(${match.raceTo})",
                style: const TextStyle(
                  color: kWhite,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                match.player2Score.toString(),
                style: const TextStyle(
                  color: kWhite,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            width: 100,
            child: Text(
              match.player2.username,
              style: const TextStyle(
                color: kWhite,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
