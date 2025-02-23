// import 'package:cloudinary_flutter/cloudinary_object.dart';
// import 'package:cloudinary_flutter/video/cld_video_controller.dart';
// import 'package:cloudinary_url_gen/cloudinary.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// /// Stateful widget nhận `publicId` từ bên ngoài.
// class VideoApp extends StatefulWidget {
//   final String publicId; // Nhận publicId từ file khác
//
//   const VideoApp({super.key, required this.publicId});
//
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//   late CldVideoController _controller;
//   Cloudinary cloudinary = CloudinaryObject.fromCloudName(cloudName: 'tivas');
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = CldVideoController(cloudinary: cloudinary, publicId: widget.publicId)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: VideoPlayer(_controller),
//         )
//             : CircularProgressIndicator(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller.value.isPlaying ? _controller.pause() : _controller.play();
//           });
//         },
//         child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }


import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LectureVideo extends StatefulWidget {
  final String videoId; // Nhận videoId từ file khác

  const LectureVideo({super.key, required this.videoId});

  @override
  _YouTubeEmbedState createState() => _YouTubeEmbedState();
}

class _YouTubeEmbedState extends State<LectureVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId, // Dùng videoId từ widget
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
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
      appBar: AppBar(title: const Text("YouTube Video")),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}

