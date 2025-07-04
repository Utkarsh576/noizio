import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';
import '../app/theme/app_colors.dart';

class PlayerScreen extends StatelessWidget {
  final String title;
  final String url;
  const PlayerScreen({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);
    final isPlaying = audioProvider.isPlaying;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note_rounded, size: 120, color: AppColors.primary),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 18, color: Colors.white)),
            const SizedBox(height: 30),
            IconButton(
              iconSize: 64,
              icon: Icon(
                isPlaying ? Icons.pause_circle : Icons.play_circle,
                color: AppColors.accent,
              ),
              onPressed: () {
                isPlaying ? audioProvider.pause() : audioProvider.resume();
              },
            )
          ],
        ),
      ),
    );
  }
}
