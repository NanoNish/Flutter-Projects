import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        count = count + 1;
        count = (count) % 4;
      });
      print(count); //for testing purposes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Container(
            color: count / 2 == 0 || count / 2 == 0.5
                ? (count % 2 == 0 ? Colors.red : Colors.yellow)
                : (count % 2 == 0 ? Colors.blue : Colors.green),
          ),
        ),
        Expanded(
          child: Container(
            color: count / 2 == 0 || count / 2 == 0.5
                ? (count % 2 == 0 ? Colors.yellow : Colors.blue)
                : (count % 2 == 0 ? Colors.green : Colors.red),
          ),
        ),
        Expanded(
          child: Container(
            color: count / 2 == 0 || count / 2 == 0.5
                ? (count % 2 == 0 ? Colors.blue : Colors.green)
                : (count % 2 == 0 ? Colors.red : Colors.yellow),
          ),
        ),
        Expanded(
          child: Container(
            color: count / 2 == 0 || count / 2 == 0.5
                ? (count % 2 == 0 ? Colors.green : Colors.red)
                : (count % 2 == 0 ? Colors.yellow : Colors.blue),
          ),
        ),
      ]),
    );
  }
}
