// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/controllers/ads_manager.dart';
import 'package:math_quize/controllers/c_method_calcul.dart';
import 'package:math_quize/models/m_answer.dart';
import 'package:math_quize/views/v_answer.dart';
import 'package:math_quize/views/v_my_home.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_drawer.dart';

class ViewResultPage extends StatefulWidget {
  const ViewResultPage({
    super.key,
    required this.score,
    required this.totalOfQuestion,
    required this.answerList,
  });

  final String score;
  final String totalOfQuestion;
  final List<ModelAnswer> answerList;

  @override
  State<ViewResultPage> createState() => _ViewResultPageState();
}

class _ViewResultPageState extends State<ViewResultPage> {
  late InterstitialAd interstitialAd;
  bool isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    AdsManager().loadAdInterstitialAd((p0) {
      interstitialAd = p0;
      setState(() {
        isAdLoaded = true;
      });
    }, (p0) {
      interstitialAd.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
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
                    child: Image.asset(
                        ControllerMethods()
                            .getImage(widget.score, widget.totalOfQuestion),
                        fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "yourScore".tr(context: context) + widget.score,
                        style: ConstAppName.titleStyle25,
                      ),
                      Text(
                        "outOf".tr(context: context) + widget.totalOfQuestion,
                        style: ConstAppName.titleStyle20,
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
                          "goToHome".tr(context: context),
                          style: ConstAppName.titleStyle18,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ViewAnswerPage(
                                data: widget.answerList,
                              ),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text("checkYourAnswer".tr(context: context),
                            style: ConstAppName.titleStyle18),
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
