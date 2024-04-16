import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_quize/constants/const_name.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WidgetAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      iconTheme: const IconThemeData(color: Colors.white),
      foregroundColor: Colors.white,
      backgroundColor: ConstAppName.colorButton,
      title: Text(
        ConstAppName.nameApp,
        style: GoogleFonts.abel(fontSize: 22),
      ),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(CupertinoIcons.music_albums),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
