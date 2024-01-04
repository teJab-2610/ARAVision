// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

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
      home: HomeScreen(),
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
