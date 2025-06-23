import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerContainerBox extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoPlayerContainerBox({super.key, required this.controller});

  @override
  _VideoPlayerContainerBoxState createState() =>
      _VideoPlayerContainerBoxState();
}

class _VideoPlayerContainerBoxState extends State<VideoPlayerContainerBox> {
  bool isFullscreen = false;
  bool isMuted = false;
  bool isVideoEnded = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    widget.controller.initialize().then((_) {
      setState(() {});
      _startTimer();
    });

    widget.controller.addListener(() {
      if (widget.controller.value.position ==
          widget.controller.value.duration) {
        setState(() {
          isVideoEnded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (isVideoEnded) {
        widget.controller.seekTo(Duration.zero); // Reset to start
        isVideoEnded = false; // Reset the end state
      }
      widget.controller.value.isPlaying
          ? widget.controller.pause()
          : widget.controller.play();
    });
  }

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
      widget.controller.setVolume(isMuted ? 0 : 1);
    });
  }

  void _toggleFullscreen() {
    setState(() {
      isFullscreen = !isFullscreen;
    });

    if (isFullscreen) {
      Navigator.of(context)
          .push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: widget.controller.value.aspectRatio,
                    child: VideoPlayer(widget.controller),
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: Icon(
                      widget.controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: _togglePlayPause,
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: VideoProgressIndicator(
                    widget.controller,
                    allowScrubbing: true,
                    colors: VideoProgressColors(
                      playedColor: Colors.red,
                      backgroundColor: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.replay, color: Colors.white),
                          onPressed: isVideoEnded
                              ? () {
                                  setState(() {
                                    widget.controller.seekTo(Duration.zero);
                                    widget.controller.play();
                                    isVideoEnded = false; // Reset the end state
                                  });
                                }
                              : null, // Disable if the video hasn't ended
                        ),
                        IconButton(
                          icon: Icon(
                            isMuted ? Icons.volume_off : Icons.volume_up,
                            color: Colors.white,
                          ),
                          onPressed: _toggleMute,
                        ),
                        Text(
                          _formatDuration(widget.controller.value.position),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.fullscreen_exit,
                              color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop(); // Exit fullscreen
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
          .then((_) {
        // Restore the state after closing fullscreen
        setState(() {
          isFullscreen = false;
        });
      });
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(":");
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (isFullscreen) {
          Navigator.of(context).pop();
          return false;
        }
        return true;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Make the video cover the full width of the container
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: widget.controller.value.size.width,
                    height: widget.controller.value.size.height,
                    child: VideoPlayer(widget.controller),
                  ),
                ),
              ),
              Center(
                child: IconButton(
                  icon: Icon(
                    widget.controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                  onPressed: _togglePlayPause,
                ),
              ),
              // Video Progress Indicator
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: VideoProgressIndicator(
                  widget.controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Colors.red,
                    backgroundColor: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
              // Control Row with Mute, Duration, Replay, and Fullscreen
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay, color: Colors.white),
                        onPressed: isVideoEnded
                            ? () {
                                setState(() {
                                  widget.controller.seekTo(Duration.zero);
                                  widget.controller.play();
                                  isVideoEnded = false; // Reset the end state
                                });
                              }
                            : null, // Disable if the video hasn't ended
                      ),
                      IconButton(
                        icon: Icon(
                          isMuted ? Icons.volume_off : Icons.volume_up,
                          color: Colors.white,
                        ),
                        onPressed: _toggleMute,
                      ),
                      Text(
                        _formatDuration(widget.controller.value.position),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          isFullscreen
                              ? Icons.fullscreen_exit
                              : Icons.fullscreen,
                          color: Colors.white,
                        ),
                        onPressed: _toggleFullscreen,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
