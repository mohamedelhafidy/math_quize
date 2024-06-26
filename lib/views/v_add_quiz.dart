// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:math_quiz/constants/const_name.dart';
import 'package:math_quiz/models/m_question.dart';
import 'package:math_quiz/views/v_question.dart';
import 'package:math_quiz/widgets/w_app_bar.dart';
import 'package:math_quiz/widgets/w_drawer.dart';
import 'package:math_quiz/widgets/w_dropdown_button.dart';
import 'package:math_quiz/widgets/w_elevated_btn.dart';
import 'package:math_quiz/widgets/w_textfieldNumber.dart';

class ViewAddQuiz extends StatefulWidget {
  const ViewAddQuiz({
    super.key,
    required this.operation,
  });
  final String operation;

  @override
  State<ViewAddQuiz> createState() => _ViewAddQuizState();
}

class _ViewAddQuizState extends State<ViewAddQuiz> {
  final TextEditingController _controllerQuestion = TextEditingController();
  final TextEditingController _controllerStartValue = TextEditingController();
  final TextEditingController _controllerEndValue = TextEditingController();

  int time = 5;
  @override
  void initState() {
    super.initState();
    _controllerQuestion.text = '5';
    _controllerStartValue.text = '0';
    _controllerEndValue.text = '10';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      appBar: const WidgetAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
            children: [
              Expanded(
                child: Text(
                  widget.operation,
                  style:
                      TextStyle(fontSize: 70, color: ConstAppName.colorButton),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WidgetTextFieldNumber(
                        controller: _controllerQuestion,
                        label: "questionLengthName".tr(context: context),
                        maxlength: 2,
                      ),
                      WidgetTextFieldNumber(
                        controller: _controllerStartValue,
                        label: "startValue".tr(context: context),
                        maxlength: 4,
                      ),
                      WidgetTextFieldNumber(
                        controller: _controllerEndValue,
                        label: "endValueName".tr(context: context),
                        maxlength: 4,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.timer),
                    const SizedBox(width: 15),
                    Text(
                      "timeName".tr(context: context),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 15),
                    WidgetDropdownButton(
                      calkBack: (value) {
                        setState(() {
                          time = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    WidgetElevatedButton(
                        onPressed: () {
                          var data = ModelQuestion(
                            operation: widget.operation,
                            lengthQuestion: int.parse(_controllerQuestion.text),
                            startValue: int.parse(_controllerStartValue.text),
                            endValue: int.parse(_controllerEndValue.text),
                            time: time,
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewQuestionPage(
                                modelQuestion: data,
                              ),
                            ),
                          );
                        },
                        title: "geQUIZ".tr(context: context),
                        width: (MediaQuery.of(context).size.width)),
                    WidgetElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: "goBack".tr(context: context),
                        width: (MediaQuery.of(context).size.width)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
