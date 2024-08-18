import 'package:bmi_calculator/bmi__calculator.dart';
import 'package:bmi_calculator/bmi_provider%20data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  BMIProviderData bmiProviderData = BMIProviderData();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => bmiProviderData),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BMICalculator(),
      ),
    );
  }
}

///////BMI Calculator done project