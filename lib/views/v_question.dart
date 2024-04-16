import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_elevated_btn.dart';

class ViewQuestionPage extends StatefulWidget {
  const ViewQuestionPage({super.key});

  @override
  State<ViewQuestionPage> createState() => _ViewWuestionPageState();
}

class _ViewWuestionPageState extends State<ViewQuestionPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      appBar: const WidgetAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular progress indicator with countdown
            Expanded(
              flex: 3,
              child: Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: 0.5, // Replace with your actual progress value
                    strokeWidth: 20,
                    backgroundColor: ConstAppName.colorShade200,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ConstAppName.colorButton),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Math question
                  const Text(
                    '2 + 3 = ?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  // Answer buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WidgetElevatedButton(
                        onPressed: () {},
                        title: '5',
                        width: width,
                      ),
                      WidgetElevatedButton(
                        onPressed: () {},
                        title: '10',
                        width: width,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WidgetElevatedButton(
                        onPressed: () {},
                        title: '7',
                        width: width,
                      ),
                      WidgetElevatedButton(
                        onPressed: () {},
                        title: '2',
                        width: width,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String text;

  const AnswerButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press
        print('Selected answer: $text');
      },
      child: Text(text),
    );
  }
}
