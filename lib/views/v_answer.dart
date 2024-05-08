// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:math_quiz/controllers/ads_manager.dart';
import 'package:math_quiz/models/m_answer.dart';
import 'package:math_quiz/views/v_my_home.dart';
import 'package:math_quiz/widgets/w_app_bar.dart';
import 'package:math_quiz/widgets/w_card_answer.dart';
import 'package:math_quiz/widgets/w_drawer.dart';
import 'package:math_quiz/widgets/w_elevated_btn.dart';

class ViewAnswerPage extends StatefulWidget {
  const ViewAnswerPage({
    super.key,
    required this.data,
  });

  final List<ModelAnswer> data;

  @override
  State<ViewAnswerPage> createState() => _ViewAnswerPageState();
}

class _ViewAnswerPageState extends State<ViewAnswerPage> {
  late InterstitialAd interstitialAd;
  bool isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    AdsManager().loadAdInterstitialAd(
      (p0) {
        interstitialAd = p0;
        setState(() {
          isAdLoaded = true;
        });
      },
      (p0) {
        interstitialAd.dispose();
      },
    );
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }

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
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return WidgetCardAnswer(
                  data: widget.data[index],
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

                    interstitialAd.show();
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
