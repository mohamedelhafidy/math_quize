import 'package:flutter/material.dart';
import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_elevated_btn.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppBar(),
      drawer: const Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              ConstAppName.imageHome,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WidgetElevatedButton(
                  width: double.infinity,
                  onPressed: () {},
                  title: ConstAppName.gePDF,
                ),
                WidgetElevatedButton(
                  width: double.infinity,
                  onPressed: () {},
                  title: ConstAppName.quiz,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}