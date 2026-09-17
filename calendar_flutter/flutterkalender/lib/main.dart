import 'package:flutter/material.dart';

//-----------------------------FUNKTIONEN--------------------------------------------//
//-----------------------------Monatsname--------------------------------------------//
String monatsName(DateTime datum) {
  List<String> monatsName = [
    'Januar',
    'Februar',
    'März',
    'April',
    'Mai',
    'Juni',
    'Juli',
    'August',
    'September',
    'Oktober',
    'November',
    'Dezember',
  ];
  return monatsName[datum.month - 1];
}

//----------------------------VISUALS ANFANG------------------------------------------//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime datumnow = DateTime.now();
    monatsName(datumnow);

    return Scaffold(body: Column(children: [Text('September 2026')]));
  }
}

//-------------------------------VISUALS ENDE--------------------------------------//
void main() {
  runApp(const MyApp());
}
