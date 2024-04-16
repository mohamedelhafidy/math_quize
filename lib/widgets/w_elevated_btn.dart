import 'package:flutter/material.dart';
import 'package:math_quize/constants/const_name.dart';

class WidgetElevatedButton extends StatelessWidget {
  const WidgetElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.width,
  });

  final Function()? onPressed;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 5),
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ConstAppName.colorButton,
        ),
        onPressed: onPressed,
        child: Text(title, style: ConstAppName.textStyleBtn),
      ),
    );
  }
}
