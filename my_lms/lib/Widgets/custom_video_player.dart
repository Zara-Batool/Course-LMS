import 'package:flutter/material.dart';
import 'package:lms/Widgets/video_player.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayerContainer extends StatefulWidget {
  final String videoPath;
  final String title;

  const CustomVideoPlayerContainer({
    super.key,
    required this.videoPath,
    required this.title,
    required VideoPlayerController controller,
  });

  @override
  _CustomVideoPlayerContainerState createState() =>
      _CustomVideoPlayerContainerState();
}

class _CustomVideoPlayerContainerState extends State<CustomVideoPlayerContainer>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.25,
              width: double.infinity,
              child: FutureBuilder<void>(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return VideoPlayerContainerBox(controller: _controller);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
