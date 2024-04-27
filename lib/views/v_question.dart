// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/controllers/c_method_calcul.dart';
import 'package:math_quize/models/m_answer.dart';
import 'package:math_quize/models/m_question.dart';
import 'package:math_quize/views/v_result.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_drawer.dart';
import 'package:math_quize/widgets/w_elevated_btn.dart';

class ViewQuestionPage extends StatefulWidget {
  const ViewQuestionPage({
    super.key,
    required this.modelQuestion,
  });

  final ModelQuestion modelQuestion;

  @override
  State<ViewQuestionPage> createState() => _ViewWuestionPageState();
}

class _ViewWuestionPageState extends State<ViewQuestionPage> {
  int score = 0;
  int time = 0;
  int seconds = 0;
  int questionLength = 0;
  int startValue = 0;
  int endValue = 0;
  String value = '';

  String operation = '';

  Timer? timer;

  var list = [];
  var listQues = [];
  List<ModelAnswer> answerList = [];

  getQuestion() {
    // check if timer  is running has been canceled
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      timer?.cancel();
    }
    if (widget.modelQuestion.lengthQuestion != questionLength) {
      setState(() {
        answerList.add(ModelAnswer(
            operation: listQues[0], answer: listQues[1], value: value));
        value = '';
      });
    }
    // check  if all questions have been answered go to  result page else show next question
    if (questionLength == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ViewResultPage(
            score: '$score',
            totalOfQuestion: '${widget.modelQuestion.lengthQuestion}',
            answerList: answerList,
          ),
        ),
      );
      return;
    }
    setState(() {
      seconds = time;
      listQues = ControllerMethods().getList(operation, startValue, endValue);
      list =
          ControllerMethods().getForValue(listQues[1], int.parse(listQues[2]));
      questionLength--;
    });

    stertTimer();
  }

  void stertTimer() {
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (Timer t) {
      setState(() {
        seconds--;
      });
      if (seconds < 0) {
        getQuestion();
        t.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    time = widget.modelQuestion.time;
    questionLength = widget.modelQuestion.lengthQuestion;
    startValue = widget.modelQuestion.startValue;
    endValue = widget.modelQuestion.endValue;
    operation = widget.modelQuestion.operation;

    getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      appBar: const WidgetAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular progress indicator with countdown
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            value: seconds /
                                time, // Replace with your actual progress value
                            strokeWidth: 20,
                            backgroundColor: ConstAppName.colorShade200,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                ConstAppName.colorButton),
                          ),
                          Center(
                            child: Text(
                              '$seconds',
                              style: TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: ConstAppName.colorShade300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // Math question
                  Expanded(
                    child: Text(
                      listQues[0],
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //== generate list of widget button
                  Expanded(
                    flex: 2,
                    child: GridView.builder(
                      itemCount: list.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return WidgetElevatedButton(
                          onPressed: () {
                            setState(() {
                              value = list[index].toString();
                              if (list[index] == listQues[1]) {
                                score++;
                              }
                              getQuestion();
                            });
                          },
                          title: list[index],
                          width: 25,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
