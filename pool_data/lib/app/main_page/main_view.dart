import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/app/main_page/main_controller.dart';

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
        backgroundColor: Colors.white,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: ControlledWidgetBuilder<MainController>(
            builder: (context, controller) {
              return Column(
                children: [
                  Container(
                    height: padding.top,
                    color: Colors.black.withOpacity(0.05),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Text(
                      'PoolData',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Text(
                      'Matches',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Text(
                      'Start a Match',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
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
