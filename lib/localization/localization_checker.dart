import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationChecker {
  static changeLanguge(BuildContext context) {
    Locale? currentLocale = EasyLocalization.of(context)?.currentLocale;
    if (currentLocale == const Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('ar', 'MA'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }

  static changeLangugeByCode(BuildContext context, String? code) {
    if (code == null) return;
    if (code == "ar") {
      EasyLocalization.of(context)!.setLocale(const Locale('ar', 'MA'));
    } else if (code == "en") {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    } else {
      return;
    }
    // Locale? currentLocale = EasyLocalization.of(context)?.currentLocale;
    // if (currentLocale == const Locale('en', 'US')) {
    //   EasyLocalization.of(context)!.setLocale(const Locale('ar', 'MA'));
    // } else {
    //   EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    // }
  }
}
