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
  bool _state = true;
  int count = 0;

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        _state = !_state;
        count = (count++) % 2;
      });
      //print(_state);  //for testing purposes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          color: _state == true ? Colors.black : Colors.red,
          height: 400,
          width: 500,
        ),
        Container(
          color: _state == true ? Colors.red : Colors.black,
          height: 400,
          width: 500,
        ),
      ]),
    );
  }
}
