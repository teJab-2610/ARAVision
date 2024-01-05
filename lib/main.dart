import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:aravision/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2, milliseconds: 500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ARAVision'), // Customize the splash screen as needed
      ),
    );
  }
}


// class VideoScreen extends StatefulWidget {
//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   bool isMinimized = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(isMinimized: isMinimized),
//       body: Column(
//         children: [
//           if (!isMinimized)
//             VideoPlayerWidget(
//                 videoUrl: 'https://www.youtube.com/watch?v=gNq5H5QP57c',
//                 isYoutube: true),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: MyScrollableText(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool isMinimized;

//   const MyAppBar({Key? key, required this.isMinimized}) : super(key: key);

//   @override
//   Size get preferredSize =>
//       Size.fromHeight(isMinimized ? kToolbarHeight : kToolbarHeight + 200.0);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text('ARAVision'),
//       actions: [
//         IconButton(
//           icon: Icon(isMinimized ? Icons.restore : Icons.fullscreen),
//           onPressed: () {
//             // Handle minimize/maximize button press
//             // You can add the logic to toggle the isMinimized state here
//           },
//         ),
//       ],
//     );
//   }
// }

// class VideoPlayerWidget extends StatefulWidget {
//   final String videoUrl;
//   final bool isYoutube;

//   const VideoPlayerWidget(
//       {Key? key, required this.videoUrl, this.isYoutube = false})
//       : super(key: key);

//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _videoPlayerController;
//   late YoutubePlayerController _youtubePlayerController;
//   late ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();

//     if (widget.isYoutube) {
//       _youtubePlayerController = YoutubePlayerController(
//         initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
//         flags: YoutubePlayerFlags(
//           autoPlay: true,
//           mute: false,
//         ),
//       );
//     } else {
//       _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
//       _chewieController = ChewieController(
//         videoPlayerController: _videoPlayerController,
//         autoPlay: true,
//         looping: true,
//       );
//     }
//   }

//   @override
//   void dispose() {
//     if (widget.isYoutube) {
//       _youtubePlayerController.dispose();
//     } else {
//       _videoPlayerController.dispose();
//       _chewieController.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.isYoutube) {
//       return YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: _youtubePlayerController,
//         ),
//         builder: (context, player) {
//           return Container(
//             height: 200.0,
//             child: player,
//           );
//         },
//       );
//     } else {
//       return Chewie(controller: _chewieController);
//     }
//   }
// }

// class MyScrollableText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Text(
//       'Your scrollable text goes here',
//       style: TextStyle(fontSize: 18.0),
//     );
//   }
// }
