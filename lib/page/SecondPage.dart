import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funi_gift/BGM.dart';
import 'package:infinite_cards/infinite_cards.dart';
import 'package:path_provider/path_provider.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  InfiniteCardsController _controller;

  Timer _countdownTimer;

  AudioCache _audioPlayer = AudioCache(prefix: 'mp3/');
  AudioPlayer _player;

  @override
  void dispose() {
    // _disposeYY();
    _countdownTimer?.cancel();
    _countdownTimer = null;
    // AppBGM.stop();
    _player?.release();
    _player = null;
    _audioPlayer = null;
    _controller = null;
    super.dispose();
  }

  // void _disposeYY() {
  //   _countdownTimer?.cancel();
  //   _countdownTimer = null;
  //   _player?.pause();
  //   _player?.stop();
  //   _player = null;
  // }

  void _initTimer() {
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _controller.next();
    });
  }

  void _initBgm() async {
    // final dir = await getApplicationDocumentsDirectory();
    // final file = File('${dir.path}/bgc_pic.mp3');
    // print(file.path);
    _player = await _audioPlayer.loop('bgc_pic.mp3');
    // AppBGM.play();
    // _audioPlayer.setVolume(1);
    // print(res);
    // _load();
  }

  // Future<Null> _load() async {
  //   final ByteData data = await rootBundle.load('assets/mp3/bgc_pic.mp3');
  //   Directory tempDir = await getTemporaryDirectory();
  //   File tempFile = File('${tempDir.path}/bgc_pic.mp3');
  //   await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
  //   var mp3Uri = tempFile.uri.toString();
  //   print('finished loading, uri=$mp3Uri');
  //   _playSound(mp3Uri);
  // }

  // void _playSound(String url) {
  //   _audioPlayer.play(
  //     url,
  //     isLocal: true,
  //   );

  //   _audioPlayer.setVolume(1);
  // }

  @override
  void initState() {
    super.initState();
    _controller = InfiniteCardsController(
      itemBuilder: _renderItem,
      itemCount: 12,
      animType: AnimType.TO_END,
    );
    _initTimer();

    _initBgm();
  }

  Widget _renderItem(BuildContext context, int index) {
    return Image(
      image: AssetImage('assets/images/pic${index + 1}.jpg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: InfiniteCards(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          controller: _controller,
          background: Colors.black,
        ),
      ),
    );
  }
}
