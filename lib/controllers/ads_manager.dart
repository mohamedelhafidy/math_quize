import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsManager {
  static bool testMode = true; //===== قم بتغيير القيم الى false قبل تصدير الملف
  late InterstitialAd? interstitialAd;
  int numInterstitialLoadAttemps = 0;

  static String get bannerAddUnitId {
    if (testMode == true) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else {
      return "ca-app-pub-1316266635498302/4649559314";
    }
  }

  static String get interstitielAddUnitId {
    if (testMode == true) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else {
      return "ca-app-pub-1316266635498302/7044622517";
    }
  }

  Future<InitializationStatus> initGooleMobileAds() {
    return MobileAds.instance.initialize();
  }

  BannerAd loadAdBanner(
      Function(Ad)? onAdLoaded, Function(Ad, LoadAdError)? onAdFailedToLoad) {
    return BannerAd(
      size: AdSize.banner,
      adUnitId: AdsManager.bannerAddUnitId,
      listener: BannerAdListener(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: onAdFailedToLoad,
      ),
      request: const AdRequest(),
    )..load();
  }

  Widget bannerAdWidget(BannerAd bannerAd, bool isLoaded) {
    if (isLoaded) {
      return SizedBox(
          width: bannerAd.size.width.toDouble(),
          height: bannerAd.size.height.toDouble(),
          child: AdWidget(
            ad: bannerAd,
          ));
    } else {
      return const SizedBox();
    }
  }

//=======================
  loadAdInterstitialAd(Function(InterstitialAd) onAdLoaded,
      Function(LoadAdError) onAdFailedToLoad) {
    InterstitialAd.load(
        adUnitId: AdsManager.interstitielAddUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: onAdFailedToLoad,
        ));
  }
}
