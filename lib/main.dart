import 'package:flutter/material.dart';
import 'package:math_quize/views/v_add_quiz.dart';
import 'package:math_quize/views/v_my_home.dart';
import 'package:math_quize/views/v_operation.dart';
import 'package:math_quize/views/v_question.dart';
import 'package:math_quize/views/v_answer.dart';
import 'package:math_quize/views/v_result1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Math_Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
