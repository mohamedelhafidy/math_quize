import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/controllers/c_method_calcul.dart';
import 'package:math_quize/views/v_result1.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_elevated_btn.dart';

class ViewQuestionPage extends StatefulWidget {
  const ViewQuestionPage({
    super.key,
    required this.operation,
    required this.lengthQuestion,
    required this.startValue,
    required this.endtValue,
    required this.time,
  });
  final String operation;
  final int lengthQuestion;
  final int startValue;
  final int endtValue;
  final int time;

  @override
  State<ViewQuestionPage> createState() => _ViewWuestionPageState();
}

class _ViewWuestionPageState extends State<ViewQuestionPage> {
  int score = 0;
  int questionLength = 0;
  var list = [];
  var listQues = [];
  getQuestion() {
    if (questionLength == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ViewResultPage(
            score: '$score',
            totalOfQuestion: '${widget.lengthQuestion}',
          ),
        ),
      );
      return;
    }
    setState(() {
      seconds = widget.time;
      listQues = ControllerMethods()
          .getList(widget.operation, widget.startValue, widget.endtValue);
      list =
          ControllerMethods().getForValue(listQues[1], int.parse(listQues[2]));
      questionLength--;
    });
    stertTimer();
  }

  int seconds = 0;
  Timer? timer;
  void stertTimer() {
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (Timer t) {
      setState(() {
        seconds--;
      });
      if (seconds == 0) {
        getQuestion();
        t.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    questionLength = widget.lengthQuestion;

    getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
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
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: 0.5, // Replace with your actual progress value
                        strokeWidth: 20,
                        backgroundColor: ConstAppName.colorShade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            ConstAppName.colorButton),
                      ),
                    ),
                    Text('Score $seconds'),
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
                              mainAxisSpacing: 15),
                      itemBuilder: (BuildContext context, int index) {
                        return WidgetElevatedButton(
                          onPressed: () {
                            setState(() {
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
              //  Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     // Math question
              //     const Text(
              //       '2 + 3 = ?',
              //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              //     ),

              //     // Answer buttons
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         WidgetElevatedButton(
              //           onPressed: () {},
              //           title: '5',
              //           width: width,
              //         ),
              //         WidgetElevatedButton(
              //           onPressed: () {},
              //           title: '10',
              //           width: width,
              //         ),
              //       ],
              //     ),

              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         WidgetElevatedButton(
              //           onPressed: () {},
              //           title: '7',
              //           width: width,
              //         ),
              //         WidgetElevatedButton(
              //           onPressed: () {},
              //           title: '2',
              //           width: width,
              //         ),
              //       ],
              //     ),

              //     SizedBox(height: 20),
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

// class AnswerButton extends StatelessWidget {
//   final String text;

//   const AnswerButton({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         // Handle button press
//         print('Selected answer: $text');
//       },
//       child: Text(text),
//     );
//   }
// }
