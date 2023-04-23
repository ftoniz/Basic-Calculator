import 'package:calculator_flutter/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CalculatorWidget extends HookWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  Widget commandRow({
    required List<Widget> children,
  }) =>
      Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      );

  Widget _clearButton({
    required String text,
    required Calculator calculator,
    required ValueNotifier<String> result,
    int weight = 1,
  }) =>
      Expanded(
        flex: weight,
        child: MaterialButton(
          onPressed: () {
            calculator.clear();
            result.value = '0';
          },
          color: Colors.white38,
          key: ValueKey(text),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );

  Widget _calculatingButton({
    required String text,
    required Calculator calculator,
    required ValueNotifier<String> result,
    int weight = 1,
  }) =>
      Expanded(
        flex: weight,
        child: MaterialButton(
          onPressed: () {
            result.value = calculator.getResult();
          },
          color: Colors.white38,
          key: ValueKey(text),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );

  Widget _mockupButton({
    required String text,
    int weight = 1,
  }) =>
      Expanded(
        flex: weight,
        child: MaterialButton(
          onPressed: () {},
          color: Colors.white38,
          key: ValueKey(text),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );

  Widget _commandButton({
    required String text,
    required Calculator calculator,
    required ValueNotifier<String> result,
    String? commandText,
    int weight = 1,
  }) =>
      Expanded(
        flex: weight,
        child: MaterialButton(
          onPressed: () {
            calculator.add(commandText ?? text);
            result.value = calculator.getDigit();
          },
          color: Colors.white38,
          key: ValueKey(text),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );

  List<Widget> resultContainer({
    required String problem,
    required ValueNotifier<String> result,
  }) {
    const color = Colors.white60;
    return [
      Container(
        padding: const EdgeInsets.only(top: 40),
        color: color,
        alignment: Alignment.bottomRight,
        child: Text(
          problem,
          textAlign: TextAlign.right,
        ),
      ),
      Container(
        color: color,
        height: 20,
      ),
      Container(
        padding: const EdgeInsets.only(bottom: 40),
        color: color,
        alignment: Alignment.bottomRight,
        child: Text(
          result.value,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var result = useState<String>('0');
    var calculatorState = useState<Calculator>(Calculator());
    var calculator = useListenable(calculatorState.value);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...resultContainer(
              problem: calculator.problem,
              result: result,
            ),
            commandRow(
              children: [
                _clearButton(
                  text: 'C',
                  calculator: calculator,
                  result: result,
                  weight: 2,
                ),
                _mockupButton(text: '%'),
                _commandButton(
                  text: '/',
                  calculator: calculator,
                  result: result,
                ),
              ],
            ),
            commandRow(
              children: [
                _commandButton(
                  text: '7',
                  calculator: calculator,
                  result: result,
                ),
                _commandButton(
                  text: '8',
                  calculator: calculator,
                  result: result,
                ),
                _commandButton(
                  text: '9',
                  calculator: calculator,
                  result: result,
                ),
                _commandButton(
                  text: 'X',
                  commandText: '*',
                  calculator: calculator,
                  result: result,
                ),
              ],
            ),
            commandRow(
              children: [
                _commandButton(
                  text: '4',
                  calculator: calculator,
                  result: result,
                ),
                _commandButton(
                  text: '5',
                  calculator: calculator,
                  result: result,
                ),
                _commandButton(
                  text: '6',
                  calculator: calculator,
                  result: result,
                ),
                _commandButton(
                  text: '-',
                  calculator: calculator,
                  result: result,
                ),
              ],
            ),
            commandRow(
              children: [
                _commandButton(
                  text: '1',
                  calculator: calculator,
                  result: result,
                ),
                _commandButton(
                  text: '2',
                  calculator: calculator,
                  result: result,
                ),
                _commandButton(
                  text: '3',
                  calculator: calculator,
                  result: result,
                ),
                _commandButton(
                  text: '+',
                  calculator: calculator,
                  result: result,
                ),
              ],
            ),
            commandRow(
              children: [
                _commandButton(
                  text: '0',
                  calculator: calculator,
                  result: result,
                  weight: 2,
                ),
                _mockupButton(text: '.'),
                _calculatingButton(
                  text: '=',
                  calculator: calculator,
                  result: result,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
