import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:path/path.dart' as path; // Import the path package
import 'package:external_path/external_path.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FloatingVideoButton extends StatelessWidget {
  final String videoUrl;

  const FloatingVideoButton({
    super.key,
    required this.videoUrl,
  });

  Future<void> _downloadVideo(BuildContext context) async {
    final yt = YoutubeExplode();
    try {
      // Extract video ID from URL
      final videoId = YoutubePlayer.convertUrlToId(videoUrl);
      if (videoId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid YouTube URL")),
        );
        return;
      }

      // Get video information
      final video = await yt.videos.get(videoId);
      final streamManifest = await yt.videos.streams.getManifest(videoId);
      final streamInfo = streamManifest.muxed.first; // Get the first stream

      // Prepare the download directory
      final downloadDirectory = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
      final filePath = path.join(downloadDirectory, '${video.title}.mp4');

      // Start the download
      final dio = Dio();
      await dio.download(streamInfo.url as String, filePath);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloaded: ${video.title}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to download video")),
      );
      print(e); // Debugging: print the error
    } finally {
      yt.close(); // Close the YoutubeExplode instance
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _downloadVideo(context),
      tooltip: 'Download Video',
      child: const Icon(Icons.download),
    );
  }
}
