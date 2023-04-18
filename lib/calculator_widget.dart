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

  Widget commandButton({
    required VoidCallback onPressed,
    required String text,
    int weight = 1,
  }) =>
      Expanded(
        flex: weight,
        child: MaterialButton(
          onPressed: onPressed,
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

  void _addMathProblem({
    required String char,
    required Calculator calculator,
    required ValueNotifier<String> result,
  }) {
    calculator.add(char);
    result.value = calculator.getDigit();
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
                commandButton(
                  onPressed: () {
                    calculator.clear();
                    result.value = '0';
                  },
                  text: 'C',
                  weight: 2,
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '%',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '%',
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '/',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '/',
                ),
              ],
            ),
            commandRow(
              children: [
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '7',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '7',
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '8',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '8',
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '9',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '9',
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '*',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: 'X',
                ),
              ],
            ),
            commandRow(
              children: [
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '4',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '4',
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '5',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '5',
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '6',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '6',
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '-',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '-',
                ),
              ],
            ),
            commandRow(
              children: [
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '1',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '1',
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '2',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '2',
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '3',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '3',
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '+',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '+',
                ),
              ],
            ),
            commandRow(
              children: [
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '0',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '0',
                  weight: 2,
                ),
                commandButton(
                  onPressed: () {
                    _addMathProblem(
                      char: '.',
                      calculator: calculator,
                      result: result,
                    );
                  },
                  text: '.',
                ),
                commandButton(
                  onPressed: () {
                    result.value = calculator.getResult();
                  },
                  text: '=',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
