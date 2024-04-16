import 'dart:math';

class ControllerMethods {
  //====
  // Methods to generate list of questions  for the quiz.
  List getList(String operation, int startValue, int endValue) {
    List question = [];
    String answer = '';
    var v1 = randomBetween(startValue, endValue);
    var v2 = randomBetween(startValue, endValue);
    String op = '$v1  $operation $v2 = ?';

    question.add(op);
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
      case 'x':
        answer = "${v1 * v2}";
        break;
      case '÷':
        if (v2 != 0) {
          answer = "${v1 ~/ v2}";
        } else {
          return getList('+', startValue, endValue);
        }
        break;
      default:
    }
    question.add(answer);
    question.add('${v1 * v2}');
    return question;
  }

  List getForValue(String answer, int max) {
    var value1 = randomBetween(0, max).toInt();
    var value2 = randomBetween(0, max).toInt();
    var value3 = randomBetween(0, max).toInt();
    var list = ['$value1', '$value2', '$value3'];
    // generates a new Random object
    final _random = new Random();
    list.insert(_random.nextInt(list.length + 1), answer);

    return list; // Randomly reorders the list;
  }

  //To generate a random integer between a minimum (min) and maximum (max) value (both inclusive)
  int randomBetween(int min, int max) {
    return min + Random().nextInt(max - min + 1);
  }
}
