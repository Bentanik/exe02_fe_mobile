import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class LectureVideoPage extends StatefulWidget {
  final String videoUrl;
  final String lectureTitle;

  const LectureVideoPage({
    super.key,
    required this.videoUrl,
    required this.lectureTitle,
  });

  @override
  State<LectureVideoPage> createState() => _LectureVideoPageState();
}

class _LectureVideoPageState extends State<LectureVideoPage> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl),formatHint: VideoFormat.hls)
      ..initialize().then((_) {
        if (mounted) {
          if (_controller.value.hasError) {
            debugPrint("Lỗi video: ${_controller.value.errorDescription}");
          } else {
            setState(() {
              _isInitialized = true;
              _chewieController = ChewieController(
                videoPlayerController: _controller,
                autoPlay: true,
                looping: false,
                aspectRatio: _controller.value.isInitialized
                    ? _controller.value.aspectRatio
                    : 16 / 9,
                allowFullScreen: true,
                allowMuting: true,
                showControls: true,
              );
            });
          }
        }
      }).catchError((error) {
        debugPrint("Lỗi khi tải video: $error");
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lectureTitle),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: _isInitialized && _chewieController != null
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Chewie(controller: _chewieController!),
        )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
