import 'package:flutter/material.dart';
import 'package:pool_data/constants.dart';

class PdTitle extends StatelessWidget {
  const PdTitle({
    super.key,
    required this.size,
    required this.text,
  });

  final Size size;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
        color: kTitleBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: kWhite,
          fontSize: 28,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
