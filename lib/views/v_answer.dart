// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_quize/models/m_answer.dart';
import 'package:math_quize/views/v_my_home.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_card_answer.dart';
import 'package:math_quize/widgets/w_drawer.dart';
import 'package:math_quize/widgets/w_elevated_btn.dart';

class ViewAnswerPage extends StatelessWidget {
  const ViewAnswerPage({
    super.key,
    required this.data,
  });

  final List<ModelAnswer> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      appBar: const WidgetAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return WidgetCardAnswer(
                  data: data[index],
                );
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetElevatedButton(
                  width: (MediaQuery.of(context).size.width) * 0.5,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MyHomePage(),
                      ),
                      (route) => false,
                    );
                  },
                  title: "goBack".tr(context: context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
