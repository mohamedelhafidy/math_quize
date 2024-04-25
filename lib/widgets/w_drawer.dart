import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_quize/constants/const_name.dart';
import 'package:math_quize/views/v_contact_me.dart';
import 'package:math_quize/views/v_my_home.dart';

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
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.message_outlined),
            title: const Text("Contact"),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const ViewContactPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.share_outlined),
            title: const Text("Share"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined),
            title: const Text("Exit"),
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
          Text(ConstAppName.nameDev, style: ConstAppName.titleStyle),
          Text(ConstAppName.email, style: ConstAppName.subtitleStyle),
        ],
      ),
    );
  }
}
