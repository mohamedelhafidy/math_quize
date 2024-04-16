// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:math_quize/constants/const_name.dart';

class WidgetDropdownButton extends StatefulWidget {
  const WidgetDropdownButton({
    super.key,
    required this.calkBack,
  });

  final Function(int) calkBack;

  @override
  State<WidgetDropdownButton> createState() => _WidgetDropdownButtonState();
}

class _WidgetDropdownButtonState extends State<WidgetDropdownButton> {
  int dropdownValue = ConstAppName.listtimes.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      onChanged: (value) {
        widget.calkBack(value!); // send value to page
        setState(() {
          dropdownValue = value;
        });
      },
      items: ConstAppName.listtimes.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(
            '$value s',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }
}
