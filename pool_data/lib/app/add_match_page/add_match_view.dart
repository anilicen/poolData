// ignore: must_be_immutable
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/app/add_match_page/add_match_controller.dart';
import 'package:pool_data/constants.dart';
import 'package:pool_data/data/repositories/match_repository.dart';
import 'package:pool_data/data/repositories/user_repository.dart';
import 'package:pool_data/domain/entities/user.dart';
import 'package:pool_data/widgets/pd_primary_button.dart';
import 'package:pool_data/widgets/pd_text_field.dart';
import 'package:pool_data/widgets/pd_title.dart';

class AddMatchView extends View {
  AddMatchView({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _AddMatchViewState(
      AddMatchController(
        DataMatchRepository(),
        DataUserRepository(),
      ),
    );
  }
}

class _AddMatchViewState extends ViewState<AddMatchView, AddMatchController> {
  _AddMatchViewState(AddMatchController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ControlledWidgetBuilder<AddMatchController>(
          builder: (context, controller) {
            return Column(
              children: [
                Container(
                  height: padding.top,
                  color: kTitleBackgroundColor,
                ),
                PdTitle(size: size, text: 'Add Match'),
                const SizedBox(
                  height: 20,
                ),
                controller.userList == null
                    ? const CircularProgressIndicator()
                    : Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Select Player 1",
                                  style: TextStyle(
                                    color: kWhite,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2<User>(
                                    isExpanded: true,
                                    hint: const Text(
                                      'Select Player 1',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: kWhite,
                                      ),
                                    ),
                                    items: controller.userList!
                                        .map(
                                          (User item) => DropdownMenuItem<User>(
                                            value: item,
                                            child: Text(
                                              item.username,
                                              style: const TextStyle(
                                                color: kWhite,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    value: controller.firstSelectedUser,
                                    onChanged: (user) {
                                      controller.selectFirstUser(user!);
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      height: 40,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: kWhite,
                                        ),
                                      ),
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: kWhite,
                                        ),
                                        color: kBackgroundColor,
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                controller.firstSelectedUser == null
                                    ? const SizedBox()
                                    : Column(
                                        children: [
                                          Text(
                                            "Matches Won: ${controller.firstSelectedUser!.matchWon}",
                                            style: const TextStyle(
                                              color: kWhite,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Matches Lost: ${controller.firstSelectedUser!.matchLost}",
                                            style: const TextStyle(
                                              color: kWhite,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                const SizedBox(height: 20),
                                controller.firstSelectedUser == null
                                    ? SizedBox()
                                    : PDTextField(
                                        size: size / 2,
                                        title: "Enter Score",
                                        hintText: "Enter Score",
                                        isObscure: false,
                                        onChanged: controller.setFirstPlayerScore,
                                      ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Select Player 1",
                                  style: TextStyle(
                                    color: kWhite,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2<User>(
                                    isExpanded: true,
                                    hint: const Text(
                                      'Select Player 2',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: kWhite,
                                      ),
                                    ),
                                    items: controller.userList!
                                        .map(
                                          (User item) => DropdownMenuItem<User>(
                                            value: item,
                                            child: Text(
                                              item.username,
                                              style: const TextStyle(
                                                color: kWhite,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    value: controller.secondSelectedUser,
                                    onChanged: (user) {
                                      controller.selectSecondUser(user!);
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      height: 40,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: kWhite,
                                        ),
                                      ),
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: kWhite,
                                        ),
                                        color: kBackgroundColor,
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                controller.secondSelectedUser == null
                                    ? const SizedBox()
                                    : Column(
                                        children: [
                                          Text(
                                            "Matches Won: ${controller.secondSelectedUser!.matchWon}",
                                            style: const TextStyle(
                                              color: kWhite,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Matches Lost: ${controller.secondSelectedUser!.matchLost}",
                                            style: const TextStyle(
                                              color: kWhite,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                const SizedBox(height: 20),
                                controller.secondSelectedUser == null
                                    ? SizedBox()
                                    : PDTextField(
                                        size: size / 2,
                                        title: "Enter Score",
                                        hintText: "Enter Score",
                                        isObscure: false,
                                        onChanged: controller.setSecondPlayerScore,
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: 20),
                PDTextField(
                  size: size / 2,
                  title: "Race To",
                  hintText: "Race To",
                  isObscure: false,
                  onChanged: controller.setRaceTo,
                ),
                Spacer(),
                PDPrimaryButton(
                  text: "Add Match",
                  onPressed: () => controller.addMatch(context),
                  isEnabled: controller.isEnabled,
                  isLoading: controller.isLoading,
                ),
                SizedBox(
                  height: padding.bottom + 50,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
