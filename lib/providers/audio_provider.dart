import 'package:flutter/material.dart';
import '../services/audio_player_service.dart';

class AudioProvider extends ChangeNotifier {
  final AudioPlayerService _audioService = AudioPlayerService();
  bool _isPlaying = false;

  AudioPlayerService get service => _audioService;
  bool get isPlaying => _isPlaying;

  Future<void> playAudio(String url) async {
    await _audioService.play(url);
    _isPlaying = true;
    notifyListeners();
  }

  void pause() {
    _audioService.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() {
    _audioService.resume();
    _isPlaying = true;
    notifyListeners();
  }
}
