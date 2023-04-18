import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Calculator extends ChangeNotifier {
  String _problem = '';

  String get problem => _problem;

  bool _isNeedReset = false;

  bool _isNumber(String text) {
    switch (text) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        return true;
    }
    return false;
  }

  bool _isOperator(String text) {
    switch (text) {
      case '+':
      case '-':
      case '*':
      case '/':
        return true;
    }
    return false;
  }

  void clear() {
    if (_problem.isEmpty) {
      return;
    }
    _problem = '';
    notifyListeners();
  }

  void add(String text) {
    var isOperator = _isOperator(text);
    var isNumber = _isNumber(text);
    var latestIsNumber =
        _problem.isEmpty ? false : _isNumber(_problem[_problem.length - 1]);

    if (isNumber || (isOperator && latestIsNumber)) {
      if (isNumber && _isNeedReset) {
        _problem = '';
      }
      _problem += text;
      _isNeedReset = false;
      notifyListeners();
    } else if (isOperator) {
      _problem = _problem.substring(0, _problem.length - 1) + text;
      _isNeedReset = false;
      notifyListeners();
    }
  }

  double _calculate(double firstValue, double secondValue, String operator) {
    switch (operator) {
      case '+':
        return firstValue + secondValue;

      case '-':
        return firstValue - secondValue;

      case '*':
        return firstValue * secondValue;

      case '/':
        return firstValue / secondValue;
    }
    return firstValue;
  }

  String getDigit() {
    if (_problem.isEmpty) {
      return '0';
    } else if (_isOperator(_problem[_problem.length - 1])) {
      return _problem[_problem.length - 1];
    }
    String tmpProblem = _problem;
    String digit = '';
    while (tmpProblem.isNotEmpty) {
      String char = tmpProblem[0];
      tmpProblem = tmpProblem.substring(1);
      if (_isNumber(char)) {
        digit = digit + char;
      } else {
        digit = '';
      }
    }
    return digit;
  }

  String getResult() {
    String tmpProblem = _problem;
    double firstValue = 0;
    double secondValue = 0;
    String currentOperator = '';
    _isNeedReset = true;
    while (tmpProblem.isNotEmpty) {
      String char = tmpProblem[0];
      if (_isNumber(char)) {
        if (currentOperator == '') {
          firstValue = (firstValue * 10) + double.parse(char);
        } else {
          secondValue = (secondValue * 10) + double.parse(char);
        }
      } else if (_isOperator(char)) {
        if (secondValue > 0) {
          firstValue = _calculate(firstValue, secondValue, currentOperator);
          secondValue = 0;
        }
        currentOperator = char;
      }
      tmpProblem = tmpProblem.substring(1);
    }

    if (secondValue > 0) {
      firstValue = _calculate(firstValue, secondValue, currentOperator);
    }
    if (firstValue.toInt().toDouble() == firstValue) {
      return firstValue.toInt().toString();
    }
    return firstValue.toString();
  }
}
