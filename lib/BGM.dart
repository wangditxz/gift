import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class AppBGM {
    static AudioCache _audioPlayer = AudioCache(prefix: 'mp3/');
    static AudioPlayer _player;

    static void play() async {
      if (_player == null) {
        _player = await _audioPlayer.loop('bgc_pic.mp3');
      } else {
        _player.resume();
      }
    }

    static void stop() {
      _player?.pause();
    }
}