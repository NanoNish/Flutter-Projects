import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
  //runApp(VideoPlayerApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'MDG Recruitment Submission'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
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
        count > 3
            ? Navigator.push(
                context, MaterialPageRoute(builder: (context) => VideoApp()))
            : count;
        count = (count) % 4;
      });
      //print(count); //for testing purposes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller =
      VideoPlayerController.network('https://i.imgur.com/MxAE8Wp.mp4');

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network('https://i.imgur.com/MxAE8Wp.mp4')
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {
              _controller.play();
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     setState(() {
        //       _controller.value.isPlaying
        //           ? _controller.pause()
        //           : _controller.play();
        //     });
        //   },
        //   child: Icon(
        //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        //   ),
        // ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
