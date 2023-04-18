import 'package:flutter/material.dart';

import 'package:calculator_flutter/calculator_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CalculatorWidget(),
      );
}
