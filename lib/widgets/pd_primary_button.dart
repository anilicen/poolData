import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pool_data/constants.dart';

class PDPrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isEnabled;
  final bool isLoading;

  PDPrimaryButton({
    required this.text,
    required this.onPressed,
    required this.isEnabled,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size.width - 40,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isEnabled ? kWhite : kWhite.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        child: Container(
          alignment: Alignment.center,
          width: size.width - 40,
          height: 56,
          child: isLoading
              ? CircularProgressIndicator(
                  color: kBlack,
                )
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
        onPressed: () {
          if (isEnabled) {
            onPressed!();
            HapticFeedback.lightImpact();
          }
        },
      ),
    );
  }
}
