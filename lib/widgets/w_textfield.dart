// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  const WidgetTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.maxLines,
      this.validator,
      this.onChanged,
      this.errorText});
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String label;
  final String? errorText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.always,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      // obscureText: true, //passWord
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: label,
          errorText: errorText),
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}
