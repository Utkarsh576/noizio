import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../services/youtube_service.dart';
import '../providers/audio_provider.dart';
import 'player_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _ytService = YouTubeService();
  List<Video> _results = [];

  void _search(String query) async {
    final videos = await _ytService.search(query);
    setState(() {
      _results = videos;
    });
  }

  void _playVideo(Video video) async {
    final audioUrl = await _ytService.getAudioStreamUrl(video.id.value);
    if (audioUrl != null && context.mounted) {
      await context.read<AudioProvider>().playAudio(audioUrl);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PlayerScreen(title: video.title, url: audioUrl),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _ytService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search YouTube')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: _search,
              decoration: InputDecoration(
                hintText: 'Search song...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _search(_controller.text),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final video = _results[index];
                  return ListTile(
                    title: Text(video.title, maxLines: 2),
                    subtitle: Text(video.author),
                    onTap: () => _playVideo(video),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
