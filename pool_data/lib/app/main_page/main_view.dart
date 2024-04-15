import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/app/main_page/main_controller.dart';
import 'package:pool_data/constants.dart';
import 'package:pool_data/widgets/pd_title.dart';

// ignore: must_be_immutable
class MainView extends View {
  MainView({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _MainViewState(
      MainController(),
    );
  }
}

class _MainViewState extends ViewState<MainView, MainController> {
  _MainViewState(MainController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: ControlledWidgetBuilder<MainController>(
            builder: (context, controller) {
              return Column(
                children: [
                  Container(
                    height: padding.top,
                    color: kTitleBackgroundColor,
                  ),
                  PdTitle(size: size, text: 'PoolData'),
                  const SizedBox(height: 50),
                  _OutlinedButton(
                    text: 'Matches',
                    onPressed: () => controller.navigateToMatchesView(context),
                  ),
                  const SizedBox(height: 50),
                  _OutlinedButton(
                    text: "Start a match",
                    onPressed: () => controller.navigateToAddMatchView(context),
                  ),
                  const SizedBox(height: 50),
                  _OutlinedButton(
                    text: "Show Players",
                    onPressed: () => controller.navigateToShowPlayersView(context),
                  ),
                  const SizedBox(height: 50),
                  _OutlinedButton(
                    text: "Scoreboard",
                    onPressed: () => controller.navigateToScoreboardView(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _OutlinedButton extends StatelessWidget {
  const _OutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: kWhite),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: kWhite,
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
