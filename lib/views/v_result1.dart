// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/views/v_my_home.dart';
import 'package:math_quize/widgets/w_app_bar.dart';

class ViewResultPage extends StatelessWidget {
  const ViewResultPage({
    super.key,
    required this.score,
    required this.totalOfQuestion,
  });

  final String score;
  final String totalOfQuestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppBar(),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Image.asset('assets/images/cong.gif',
                        fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        ConstAppName.yourScore + score,
                        style: TextStyle(
                            fontSize: 25, color: ConstAppName.colorShade300),
                      ),
                      Text(
                        ConstAppName.outOf + totalOfQuestion,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MyHomePage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text(
                          ConstAppName.goToHome,
                          style: TextStyle(
                              fontSize: 18, color: ConstAppName.colorShade300),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          ConstAppName.checkYourAnswer,
                          style: TextStyle(
                              fontSize: 18, color: ConstAppName.colorShade300),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
