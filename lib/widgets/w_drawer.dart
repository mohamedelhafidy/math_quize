import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_quiz/constants/const_name.dart';
import 'package:math_quiz/controllers/c_method_calcul.dart';
import 'package:math_quiz/views/v_my_home.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch, //  Strecth the column to fill the full width
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    );
  }

  Container buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        // runSpacing: 5, // space between row
        children: [
          //  Button Menu Home
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text(
              "titleHome".tr(context: context),
              style: GoogleFonts.abel(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          // Button Menu Contact
          ListTile(
              leading: const Icon(Icons.message_outlined),
              title: Text(
                "titleContact".tr(context: context),
                style: GoogleFonts.abel(fontWeight: FontWeight.bold),
              ),
              onTap: ControllerMethods().launchWhatsAppUri
              // () {
              //   // // close navigation drawer before
              //   // Navigator.pop(context);
              //   // Navigator.of(context).push(
              //   //   MaterialPageRoute(
              //   //     builder: (_) => const ViewContactPage(),
              //   //   ),
              //   // );
              // },
              ),
          // Button Menu More apps
          ListTile(
            leading: const Icon(Icons.more_outlined),
            title: Text(
              "titleMoreApps".tr(context: context),
              style: GoogleFonts.abel(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              ControllerMethods().openPlayStore();
            },
          ),

          // Button Policy
          ListTile(
            leading: const Icon(Icons.policy_outlined),
            title: Text(
              "titlePolicy".tr(context: context),
              style: GoogleFonts.abel(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              ControllerMethods().openPolicy();
            },
          ),
          //  Button Menu Exit app
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined),
            title: Text(
              "titleExitApp".tr(context: context),
              style: GoogleFonts.abel(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }

  Container buildHeader(BuildContext context) {
    return Container(
      color: ConstAppName.colorButton,
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: 20),
      child: Column(
        children: [
          const CircleAvatar(
              radius: 52, backgroundImage: AssetImage(ConstAppName.avatar)),
          const SizedBox(height: 12),
          Text("nameDev".tr(context: context), style: ConstAppName.titleStyle),
          Text("email".tr(context: context), style: ConstAppName.subtitleStyle),
        ],
      ),
    );
  }
}
