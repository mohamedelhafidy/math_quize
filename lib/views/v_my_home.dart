import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/controllers/ads_manager.dart';
import 'package:math_quize/views/v_operation.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_drawer.dart';
import 'package:math_quize/widgets/w_elevated_btn.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //=====Ads vaiable ==============================
  late BannerAd _bannerAd;
  bool _isLoaded = false;
  //==============================================

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();

    //============ ADS ============
    AdsManager().initGooleMobileAds();
    _bannerAd = AdsManager().loadAdBanner(
      (ad) {
        setState(() {
          _isLoaded = true;
        });
      },
      (ad, error) {
        setState(() {
          _isLoaded = false;
        });
      },
    );
    //========================
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppBar(),
      drawer: const WidgetDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: Image.asset(
              ConstAppName.imageHome,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WidgetElevatedButton(
                  width: double.infinity,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewOperationPage(),
                      ),
                    );
                  },
                  title: "quiz".tr(context: context),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: AdsManager().bannerAdWidget(_bannerAd, _isLoaded),
            ),
          ),
        ],
      ),
    );
  }
}
