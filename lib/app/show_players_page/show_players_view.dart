import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/app/show_players_page/show_players_controller.dart';
import 'package:pool_data/constants.dart';
import 'package:pool_data/data/repositories/user_repository.dart';
import 'package:pool_data/domain/entities/user.dart';
import 'package:pool_data/widgets/pd_title.dart';

// ignore: must_be_immutable
class ShowPlayersView extends View {
  ShowPlayersView({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _ShowPlayersViewState(
      ShowPlayersController(
        DataUserRepository(),
      ),
    );
  }
}

class _ShowPlayersViewState extends ViewState<ShowPlayersView, ShowPlayersController> {
  _ShowPlayersViewState(ShowPlayersController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ControlledWidgetBuilder<ShowPlayersController>(
          builder: (context, controller) {
            return Column(
              children: [
                Container(
                  height: padding.top,
                  color: kTitleBackgroundColor,
                ),
                PdTitle(size: size, text: 'Players'),
                controller.userList == null
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
                                for (User user in controller.userList!) _UserContainer(size: size, user: user)
                              ],
                            ),
                          ),
                        ),
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}

class _UserContainer extends StatelessWidget {
  const _UserContainer({
    super.key,
    required this.size,
    required this.user,
  });

  final Size size;
  final User user;

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
            SizedBox(width: 10),
            Container(
              width: 200,
              child: Text(
                user.username,
                style: TextStyle(
                  fontSize: 20,
                  color: kWhite,
                ),
              ),
            ),
            Spacer(),
            Container(
              child: Text(
                "W: ${user.matchWon} L: ${user.matchLost}",
                style: TextStyle(
                  fontSize: 20,
                  color: kWhite,
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ));
  }
}
