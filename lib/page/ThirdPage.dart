import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  VideoPlayerController _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/mp4/nini.m4v')
      //       _controller = VideoPlayerController.network(
      //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      // )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
      ),
    );
  }
}
