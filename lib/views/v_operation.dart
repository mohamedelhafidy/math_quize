// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/views/v_add_quiz.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_card_operation.dart';
import 'package:math_quize/widgets/w_drawer.dart';
import 'package:math_quize/widgets/w_elevated_btn.dart';

class ViewOperationPage extends StatelessWidget {
  const ViewOperationPage({super.key});

  goToAddQuiz(BuildContext context, String operation) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ViewAddQuiz(operation: operation)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      appBar: const WidgetAppBar(),
      body: Container(
        margin: const EdgeInsets.all(10),
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "chooseAnyOne".tr(context: context),
                  style: GoogleFonts.aBeeZee(
                      fontSize: 40,
                      color: ConstAppName.colorButton,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        WidgetCardOperation(
                            title: '+',
                            onTap: () {
                              goToAddQuiz(context, '+');
                            }),
                        WidgetCardOperation(
                            title: '-',
                            onTap: () {
                              goToAddQuiz(context, '-');
                            }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        WidgetCardOperation(
                            title: 'x',
                            onTap: () {
                              goToAddQuiz(context, 'x');
                            }),
                        WidgetCardOperation(
                            title: '÷',
                            onTap: () {
                              goToAddQuiz(context, '÷');
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: WidgetElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: "goBack".tr(context: context),
                    width: double.infinity),
              ),
            ),
            // Advertisement
            const Expanded(
              child: Text('public'),
            ),
          ],
        ),
      ),
    );
  }
}
