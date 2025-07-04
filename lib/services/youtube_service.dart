import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YouTubeService {
  final YoutubeExplode _yt = YoutubeExplode();

  // Search videos by keyword
  Future<List<Video>> search(String query) async {
    final searchResults = await _yt.search.getVideos(query);
    return searchResults.toList();
  }

  // Get audio stream URL
  Future<String?> getAudioStreamUrl(String videoId) async {
    try {
      var manifest = await _yt.videos.streamsClient.getManifest(videoId);
      var audioStream = manifest.audioOnly.withHighestBitrate();
      return audioStream.url.toString();
    } catch (e) {
      print("Error fetching audio stream: $e");
      return null;
    }
  }

  void close() {
    _yt.close();
  }
}
