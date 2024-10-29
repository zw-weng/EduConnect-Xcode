import 'package:educonnect/constants/colors.dart';
import 'package:educonnect/widgets/floating_video_button.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPreviewScreen extends StatefulWidget {
  final String videoUrl;
  final String? videoTitle; // Optional video title

  const VideoPreviewScreen({
    super.key,
    required this.videoUrl,
    this.videoTitle,
  });

  @override
  _VideoPreviewScreenState createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Extract the YouTube video ID from the video URL
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true, // Auto-play the video
        mute: false, // Start with audio unmuted
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
        centerTitle: true,
        elevation: 4.0,
      ),
      body: Column(
        children: [
          // Display the video player
          Expanded(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                // You can perform additional actions when the player is ready
              },
            ),
          ),
          // Display video title if provided
          if (widget.videoTitle != null) 
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.videoTitle!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingVideoButton(videoUrl: widget.videoUrl), // Add the floating button here
    );
  }
}
