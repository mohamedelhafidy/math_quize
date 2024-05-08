import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_quiz/constants/const_name.dart';
import 'package:math_quiz/localization/localization_checker.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WidgetAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: const Icon(Icons.menu),
      iconTheme: const IconThemeData(color: Colors.white),
      foregroundColor: Colors.white,
      backgroundColor: ConstAppName.colorButton,
      title: Text(
        "nameApp".tr(context: context),
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
              LocalizationChecker.changeLangugeByCode(context, value!);
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
