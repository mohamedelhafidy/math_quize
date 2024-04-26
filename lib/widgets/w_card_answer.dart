import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/controllers/c_method_calcul.dart';
import 'package:math_quize/localization/locales.dart';
import 'package:math_quize/models/m_answer.dart';

class WidgetCardAnswer extends StatelessWidget {
  const WidgetCardAnswer({
    super.key,
    required this.data,
  });

  final ModelAnswer data;

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
          ControllerMethods().getIcon(data.answer, data.value),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.operation,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white)),
              Text(
                  '${LocaleData.titleAnswer.getString(context)} ${data.answer}',
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(data.value, style: const TextStyle(color: Colors.orange)),
          )
        ],
      ),
    );
  }
}
