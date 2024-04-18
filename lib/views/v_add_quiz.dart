// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/models/m_question.dart';
import 'package:math_quize/views/v_question.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_dropdown_button.dart';
import 'package:math_quize/widgets/w_elevated_btn.dart';
import 'package:math_quize/widgets/w_textfield.dart';

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
                      WidgetTextField(
                        controller: _controllerQuestion,
                        label: ConstAppName.questionLengthName,
                        maxlength: 2,
                      ),
                      WidgetTextField(
                        controller: _controllerStartValue,
                        label: ConstAppName.startValue,
                        maxlength: 4,
                      ),
                      WidgetTextField(
                        controller: _controllerEndValue,
                        label: ConstAppName.endValueName,
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
                    const Text(
                      ConstAppName.timeName,
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                        title: ConstAppName.geQUIZ,
                        width: (MediaQuery.of(context).size.width)),
                    WidgetElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: ConstAppName.goBack,
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
