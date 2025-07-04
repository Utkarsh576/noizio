import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  final AudioPlayer _player = AudioPlayer();

  AudioPlayer get player => _player;

  Future<void> play(String url) async {
    try {
      await _player.setUrl(url);
      _player.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() => _player.pause();

  void resume() => _player.play();

  void dispose() => _player.dispose();
}
