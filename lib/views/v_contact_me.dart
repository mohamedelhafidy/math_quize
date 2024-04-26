import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:math_quize/controllers/c_method_calcul.dart';
import 'package:math_quize/localization/locales.dart';
import 'package:math_quize/widgets/w_app_bar.dart';
import 'package:math_quize/widgets/w_elevated_btn.dart';
import 'package:math_quize/widgets/w_textfield.dart';

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
                  label: LocaleData.lblName.getString(context),
                  controller: _controllerName,
                  errorText: _nameErrorText,
                  validator: (value) => _emailErrorText,
                  onChanged: (value) {
                    setState(() {
                      _nameErrorText = ControllerMethods().validateEnter(
                          value, LocaleData.msgErrorName.getString(context));
                    });
                  },
                ),
                const SizedBox(height: 16),
                WidgetTextField(
                  label: LocaleData.lblEmail.getString(context),
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
                  label: LocaleData.lblMessage.getString(context),
                  controller: _controllerMessage,
                  errorText: _messageErrorText,
                  validator: (value) => _messageErrorText,
                  onChanged: (value) {
                    setState(() {
                      _messageErrorText = ControllerMethods().validateEnter(
                          value, LocaleData.msgErrorMessage.getString(context));
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
                      title: LocaleData.send.getString(context),
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
