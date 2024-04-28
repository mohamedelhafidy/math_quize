import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_quize/constants/const_name.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ControllerMethods {
  //====
  // Methods to generate list of questions  for the quiz.
  List getList(String operation, int startValue, int endValue) {
    List question = [];
    String answer = '';
    var v1 = randomBetween(startValue, endValue);
    var v2 = randomBetween(startValue, endValue);

    switch (operation) {
      case '+':
        answer = "${v1 + v2}";
        break;
      case '-':
        if (v1 > v2) {
          answer = "${v1 - v2}";
        } else {
          return getList('-', startValue, endValue);
        }
        break;
      case '×':
        answer = "${v1 * v2}";
        break;
      case '÷':
        if (v1 != 0) {
          v2 = randomValueInList(findDivisors(v1));
          answer = "${v1 ~/ v2}";
        } else {
          return getList('÷', startValue, endValue);
        }
        break;
      default:
    }
    String op = '$v1 $operation $v2 = ?';

    question.add(op);

    question.add(answer);
    question.add('${int.parse(answer) * 2}');
    return question;
  }

// Generate a random number between the given 4 values
  List getForValue(String answer, int max) {
    var list = [];
    if (max < 5) max = (max + 1) * 5;
    for (int i = 0; i < 3; i++) {
      var value = randomBetween(0, max).toString();
      if (list.contains(value) || answer == value) {
        i--;
      } else {
        list.add(value);
      }
    }
    final random = Random();
    list.insert(random.nextInt(list.length + 1), answer);

    return list; // Randomly reorders the list;
  }

  //To generate a random integer between a minimum (min) and maximum (max) value (both inclusive)
  int randomBetween(int min, int max) {
    return min + Random().nextInt(max - min + 1);
  }

  // - Returns: A list of positive integers that are divisors of the input number.
  List<int> findDivisors(int number) {
    if (number <= 0) {
      throw ArgumentError('Number should be a positive integer.');
    }

    List<int> divisors = [];
    for (int i = 1; i <= number; i++) {
      if (number % i == 0) {
        divisors.add(i);
      }
    }

    return divisors;
  }

// get a random value from a list in Dart
  int randomValueInList(List list) {
    int randomIndex = Random().nextInt(list.length);
    var randomChoice = list[randomIndex];
    return randomChoice;
  }

  Widget getIcon(String answer, String value) {
    if (value == "") {
      return const Icon(
        Icons.cancel,
        size: 40,
        color: Colors.red,
      );
    } else {
      int ans = int.parse(answer);
      int val = int.parse(value);
      if (ans == val) {
        return const Icon(
          Icons.verified,
          size: 40,
          color: Colors.green,
        );
      } else {
        return const Icon(
          Icons.cancel,
          size: 40,
          color: Colors.red,
        );
      }
    }
  }

  String getImage(String score, String totalOfQuestion) {
    int score0 = int.parse(score);
    int totalOfQuestion0 = int.parse(totalOfQuestion);
    if (score0 < totalOfQuestion0 / 2) {
      return ConstAppName.commasatatons;
    } else {
      return ConstAppName.congratulationGif;
    }
  }

// validated Email and Name

  bool isEmailValid(String email) {
    // Basic email validation using regex
    // You can implement more complex validation if needed
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  String? validateEmail(BuildContext context, String value) {
    String? emailErrorText;
    if (value.isEmpty) {
      emailErrorText = "msgErrorEmail".tr(context: context);
    } else if (!isEmailValid(value)) {
      emailErrorText = "msgErrorEmail2".tr(context: context);
    } else {
      emailErrorText = null;
    }
    return emailErrorText;
  }

  String? validateEnter(String value, String message) {
    String? nameErrorText;
    if (value.trim().isEmpty) {
      nameErrorText = message;
    } else {
      nameErrorText = null;
    }

    return nameErrorText;
  }

//============
// Open PlayStore  or App Store Page.
  void openPlayStore() async {
    var url = Uri.parse(
        'https://play.google.com/store/apps/developer?id=INFOWA7FID&hl=ar&gl=US');
    if (!await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Open Whatsapp App for send MSG.
  void launchWhatsAppUri() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+212640001009',
      text: "Welcome. Thank you for this wonderful application",
    );
    // Convert the WhatsAppUnilink instance to a Uri.
    // The "launch" method is part of "url_launcher".
    await launchUrl(link.asUri());
  }
}
