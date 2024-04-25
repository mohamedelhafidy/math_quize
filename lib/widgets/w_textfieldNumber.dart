// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetTextFieldNumber extends StatelessWidget {
  const WidgetTextFieldNumber({
    super.key,
    required this.controller,
    required this.label,
    required this.maxlength,
  });

  final TextEditingController controller;
  final String label;
  final int maxlength;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        // obscureText: true, //passWord
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            // hintText: 'Enter a search term',
            label: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            prefixIcon: const Icon(Icons.add)),
        keyboardType: TextInputType.number,
        maxLength: maxlength,
      ),
    );
  }
}
