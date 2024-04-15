// ignore: must_be_immutable
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/app/scoreboard_page/scoreboard_controller.dart';
import 'package:pool_data/constants.dart';

class ScoreboardView extends View {
  ScoreboardView({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _ScoreboardViewState(
      ScoreboardController(),
    );
  }
}

class _ScoreboardViewState extends ViewState<ScoreboardView, ScoreboardController> {
  _ScoreboardViewState(ScoreboardController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ControlledWidgetBuilder<ScoreboardController>(
          builder: (context, controller) {
            return Column(
              children: [
                Container(
                  height: padding.top,
                  color: kTitleBackgroundColor,
                ),
                GestureDetector(
                  onTap: controller.increasePlayer1Score,
                  onLongPress: controller.decreasePlayer1Score,
                  child: Container(
                    width: size.width,
                    height: (size.height - padding.top - padding.bottom - 50) / 2,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "${controller.player1Score}",
                        style: const TextStyle(
                          color: kWhite,
                          fontSize: 144,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                GestureDetector(
                  onTap: controller.increasePlayer2Score,
                  onLongPress: controller.decreasePlayer2Score,
                  child: Container(
                    width: size.width,
                    height: (size.height - padding.top - padding.bottom - 50) / 2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "${controller.player2Score}",
                        style: const TextStyle(
                          color: kBlack,
                          fontSize: 144,
                        ),
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
