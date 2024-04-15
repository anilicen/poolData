import 'package:flutter/material.dart';
import 'package:pool_data/constants.dart';

class PDTextField extends StatelessWidget {
  const PDTextField({
    super.key,
    required this.size,
    required this.title,
    required this.hintText,
    required this.isObscure,
    required this.onChanged,
    this.color,
  });

  final Size size;
  final String title;
  final String hintText;
  final bool isObscure;
  final void Function(String text) onChanged;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 40,
      child: Column(
        children: [
          Container(
            width: size.width - 40,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: kWhite,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 6),
          TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(height: 1, color: kWhite),
            obscureText: isObscure,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color ?? kWhite),
                borderRadius: BorderRadius.circular(10),
              ),
              filled: false,
              hintStyle: TextStyle(color: kWhite),
              hintText: hintText,
            ),
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
