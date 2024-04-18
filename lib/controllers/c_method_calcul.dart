import 'dart:math';

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
      case 'x':
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
    String op = '$v1  $operation $v2 = ?';

    question.add(op);

    question.add(answer);
    question.add('${int.parse(answer) * 2}');
    return question;
  }

// Generate a random number between the given 4 values
  List getForValue(String answer, int max) {
    var list = [];
    for (int i = 0; i < 3; i++) {
      var value = randomBetween(0, max).toString();
      if (list.contains(value) || answer == value) {
        i--;
      } else {
        list.add('$value');
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
}
