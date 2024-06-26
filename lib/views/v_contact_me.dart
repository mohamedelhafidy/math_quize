import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_quiz/controllers/c_method_calcul.dart';
import 'package:math_quiz/widgets/w_app_bar.dart';
import 'package:math_quiz/widgets/w_elevated_btn.dart';
import 'package:math_quiz/widgets/w_textfield.dart';

class ViewContactPage extends StatefulWidget {
  const ViewContactPage({super.key});

  @override
  ViewContactPageState createState() => ViewContactPageState();
}

class ViewContactPageState extends State<ViewContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerMessage = TextEditingController();

  String? _emailErrorText;
  String? _nameErrorText;
  String? _messageErrorText;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                WidgetTextField(
                  label: "lblName".tr(context: context),
                  controller: _controllerName,
                  errorText: _nameErrorText,
                  validator: (value) => _emailErrorText,
                  onChanged: (value) {
                    setState(() {
                      _nameErrorText = ControllerMethods().validateEnter(
                          value, "msgErrorName".tr(context: context));
                    });
                  },
                ),
                const SizedBox(height: 16),
                WidgetTextField(
                  label: "lblEmail".tr(context: context),
                  controller: _controllerEmail,
                  errorText: _emailErrorText,
                  validator: (value) => _emailErrorText,
                  onChanged: (value) {
                    setState(() {
                      _emailErrorText =
                          ControllerMethods().validateEmail(context, value);
                    });
                  },
                ),
                const SizedBox(height: 16),
                WidgetTextField(
                  label: "lblMessage".tr(context: context),
                  controller: _controllerMessage,
                  errorText: _messageErrorText,
                  validator: (value) => _messageErrorText,
                  onChanged: (value) {
                    setState(() {
                      _messageErrorText = ControllerMethods().validateEnter(
                          value, "msgErrorMessage".tr(context: context));
                    });
                  },
                  maxLines: 5,
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetElevatedButton(
                      onPressed: () {
                        _submitForm();
                      },
                      title: "send".tr(context: context),
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
