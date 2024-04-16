// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_card_answer.dart';
import 'package:math_quize/widgets/w_elevated_btn.dart';

class ViewAnswerPage extends StatelessWidget {
  const ViewAnswerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const WidgetCardAnswer(quation: '2 + 3', answer: '5', value: '5'),
          const WidgetCardAnswer(quation: '2 + 6', answer: '8', value: '8'),
          const WidgetCardAnswer(quation: '1 + 3', answer: '4', value: '4'),
          const WidgetCardAnswer(quation: '1 + 6', answer: '7', value: '7'),
          const WidgetCardAnswer(quation: '1 + 10', answer: '11', value: '11'),
          WidgetElevatedButton(
            width: (MediaQuery.of(context).size.width) * 0.5,
            onPressed: () {},
            title: ConstAppName.goBack,
          )
        ],
      ),
    );
  }
}
