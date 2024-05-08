import 'package:flutter/material.dart';
import 'package:math_quiz/constants/const_name.dart';

class WidgetCardOperation extends StatelessWidget {
  const WidgetCardOperation({
    super.key,
    required this.onTap,
    required this.title,
  });

  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: InkWell(
          onTap: onTap,
          child: Card(
            color: ConstAppName.colorButton,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
