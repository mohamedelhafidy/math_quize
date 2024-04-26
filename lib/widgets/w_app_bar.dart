import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/localization/locales.dart';

class WidgetAppBar extends StatefulWidget implements PreferredSizeWidget {
  const WidgetAppBar({
    super.key,
  });

  @override
  State<WidgetAppBar> createState() => _WidgetAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _WidgetAppBarState extends State<WidgetAppBar> {
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  void _setLocale(String? value) {
    if (value == null) return;
    if (value == "en") {
      _flutterLocalization.translate("en");
    } else if (value == "ar") {
      _flutterLocalization.translate("ar");
    } else {
      return;
    }

    setState(() {
      _currentLocale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: const Icon(Icons.menu),
      iconTheme: const IconThemeData(color: Colors.white),
      foregroundColor: Colors.white,
      backgroundColor: ConstAppName.colorButton,
      title: Text(
        LocaleData.nameApp.getString(context),
        style: GoogleFonts.abel(fontSize: 22),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            underline: SizedBox(),
            icon: const Icon(
              Icons.language_outlined,
              color: Colors.white,
            ),
            // value: _currentLocale,
            items: const [
              DropdownMenuItem(
                  value: "en",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("🇺🇸"),
                      Text("English"),
                    ],
                  )),
              DropdownMenuItem(
                  value: "ar",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("🇸🇦"),
                      Text("العربية"),
                    ],
                  )),
            ],
            onChanged: (value) {
              _setLocale(value);
            },
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Image.asset(
        //     ConstAppName.icon,
        //     width: 45,
        //     height: 45,
        //   ),
        // ),
      ],
    );
  }
}
