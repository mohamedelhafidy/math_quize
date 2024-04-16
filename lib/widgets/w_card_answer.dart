import 'package:flutter/material.dart';
import 'package:math_quize/constants/const_name.dart';

class WidgetCardAnswer extends StatelessWidget {
  const WidgetCardAnswer({
    super.key,
    required this.quation,
    required this.answer,
    required this.value,
  });

  final String quation;
  final String answer;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ConstAppName.colorButton,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.verified,
            size: 40,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$quation = ?',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white)),
              Text('Answer = $answer',
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          Text(value, style: const TextStyle(color: Colors.orange))
        ],
      ),
    );
  }
}
