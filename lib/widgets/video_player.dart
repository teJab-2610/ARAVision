import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final bool isYoutube;

  const VideoPlayerWidget(
      {Key? key, required this.videoUrl, this.isYoutube = false})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late YoutubePlayerController _youtubePlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    if (widget.isYoutube) {
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    } else {
      _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: false,
        looping: false,
      );
    }
  }
  @override
  void dispose() {
    if (widget.isYoutube) {
      _youtubePlayerController.dispose();
    } else {
      _videoPlayerController.dispose();
      _chewieController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isYoutube) {
      return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _youtubePlayerController,
        ),
        builder: (context, player) {
          return Container(
            height: 200.0,
            child: player,
          );
        },
      );
    } else {
      return Chewie(controller: _chewieController);
    }
  }
}