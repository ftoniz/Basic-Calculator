// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator_flutter/app.dart';
import 'package:calculator_flutter/calculator.dart';
import 'package:calculator_flutter/calculator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets(
    'Calculator Widget smoke test',
    (tester) async {
      await tester.pumpWidget(
        HookBuilder(
          builder: (_) => const MaterialApp(
            home: CalculatorWidget(),
          ),
        ),
      );
      expect(find.text('0'), findsNWidgets(2));
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('4'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.text('6'), findsOneWidget);
      expect(find.text('7'), findsOneWidget);
      expect(find.text('8'), findsOneWidget);
      expect(find.text('9'), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('1')));
      await tester.pump();
      expect(find.text('0'), findsNWidgets(1));
      expect(find.text('1'), findsNWidgets(3));
      await tester.tap(find.byKey(const ValueKey('1')));
      await tester.pump();
      expect(find.text('0'), findsNWidgets(1));
      expect(find.text('1'), findsNWidgets(1));
      expect(find.text('11'), findsNWidgets(2));
    },
  );

  test(
    'Calculator get digit smoke test',
    () {
      var calculator = Calculator();
      expect(calculator.getDigit(), '0');
      calculator
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.getDigit(), '111');
      calculator
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.getDigit(), '111111');
      calculator.add('+');
      expect(calculator.getDigit(), '+');
      calculator.add('-');
      expect(calculator.getDigit(), '-');
      calculator
        ..add('1')
        ..add('2')
        ..add('3');
      expect(calculator.getDigit(), '123');
      calculator.clear();
      expect(calculator.getDigit(), '0');
    },
  );

  test(
    'Calculator get result smoke test',
    () {
      var calculator = Calculator();
      expect(calculator.getResult(), '0');
      calculator
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.getResult(), '111');
      calculator
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.getResult(), '111');
      calculator
        ..add('1')
        ..add('1')
        ..add('1')
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.getResult(), '111111');
      calculator
        ..add('+')
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.getResult(), '111222');
      calculator
        ..add('-')
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.getResult(), '111111');
      calculator
        ..add('*')
        ..add('2');
      expect(calculator.getResult(), '222222');
      calculator
        ..add('*')
        ..add('2');
      expect(calculator.getResult(), '444444');
      calculator
        ..add('/')
        ..add('4');
      expect(calculator.getResult(), '111111');
      calculator
        ..add('/')
        ..add('1')
        ..add('0');
      expect(calculator.getResult(), '11111.1');
      calculator.clear();
      expect(calculator.getDigit(), '0');
    },
  );

  test(
    'Calculator problem string smoke test',
    () {
      var calculator = Calculator();
      expect(calculator.problem, '');
      calculator
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.problem, '111');
      calculator
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.problem, '111111');
      calculator
        ..add('1')
        ..add('1')
        ..add('1')
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.problem, '111111111111');
      calculator
        ..add('+')
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.problem, '111111111111+111');
      calculator
        ..add('-')
        ..add('1')
        ..add('1')
        ..add('1');
      expect(calculator.problem, '111111111111+111-111');
      calculator
        ..add('*')
        ..add('2');
      expect(calculator.problem, '111111111111+111-111*2');
      calculator
        ..add('*')
        ..add('2');
      expect(calculator.problem, '111111111111+111-111*2*2');
      calculator
        ..add('/')
        ..add('4');
      expect(calculator.problem, '111111111111+111-111*2*2/4');
      calculator
        ..add('/')
        ..add('1')
        ..add('0');
      expect(calculator.problem, '111111111111+111-111*2*2/4/10');
      calculator.clear();
      expect(calculator.problem, '');
    },
  );
}
