import 'package:flutter/material.dart';
import 'package:math_quize/views/v_my_home.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),

          // Expanded(
          //   child: Container(
          //     color: ConstAppName.colorButton,
          //     child: Center(
          //       child: SizedBox(
          //         width: 100,
          //         child: CircleAvatar(
          //           minRadius: 40,
          //           child: Image.asset(ConstAppName.icon),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Wrap(
                runSpacing: 16, // space between row
                children: [
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text("Home"),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                    },
                  ),
                  ListTile(
                      leading: Icon(Icons.home_outlined),
                      title: Text("Home"),
                      onTap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
