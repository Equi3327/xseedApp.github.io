import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key, required this.url});
  final String url;

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late YoutubePlayerController _controller;
  // String? _url;

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.url,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    // _controller = YoutubePlayerController(
    //   params: const YoutubePlayerParams(
    //     showControls: true,
    //     mute: false,
    //     showFullscreenButton: true,
    //     loop: false,
    //   ),
    // );
    //
    // _controller.setFullScreenListener(
    //       (isFullScreen) {
    //     debugPrint('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
    //   },
    // );
    //
    // _controller.loadVideo(widget.url);
    // loadPlaylist(
    //   list: _videoIds,
    //   listType: ListType.playlist,
    //   startSeconds: 136,
    // );
    // _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          YoutubePlayerScaffold(
            controller: _controller,
            aspectRatio: 16 / 9,
            builder: (context, player) {
              return Column(
                children: [
                  player,
                  Text('Youtube Player'),
                ],
              );
            },
          ),
          // _controller.value.isInitialized
          //     ? AspectRatio(
          //         aspectRatio: _controller.value.aspectRatio,
          //         child: VideoPlayer(_controller),
          //       )
          //     : Container(),
          // _ControlsOverlay(controller: _controller),
          // VideoProgressIndicator(_controller, allowScrubbing: true),
        ],
      ),
    );
    // _controller.value.isInitialized
    //     ? AspectRatio(
    //         aspectRatio: _controller.value.aspectRatio,
    //         child: VideoPlayer(_controller),
    //       )
    //     : Container();
  }
}

// class _ControlsOverlay extends StatelessWidget {
//   const _ControlsOverlay({required this.controller});
//
//   static const List<Duration> _exampleCaptionOffsets = <Duration>[
//     Duration(seconds: -10),
//     Duration(seconds: -3),
//     Duration(seconds: -1, milliseconds: -500),
//     Duration(milliseconds: -250),
//     Duration.zero,
//     Duration(milliseconds: 250),
//     Duration(seconds: 1, milliseconds: 500),
//     Duration(seconds: 3),
//     Duration(seconds: 10),
//   ];
//   static const List<double> _examplePlaybackRates = <double>[
//     0.25,
//     0.5,
//     1.0,
//     1.5,
//     2.0,
//     3.0,
//     5.0,
//     10.0,
//   ];
//
//   final VideoPlayerController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: const Duration(milliseconds: 50),
//           reverseDuration: const Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? const SizedBox.shrink()
//               : Container(
//                   color: Colors.black26,
//                   child: const Center(
//                     child: Icon(
//                       Icons.play_arrow,
//                       color: Colors.white,
//                       size: 100.0,
//                       semanticLabel: 'Play',
//                     ),
//                   ),
//                 ),
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.value.isPlaying ? controller.pause() : controller.play();
//           },
//         ),
//         Align(
//           alignment: Alignment.topLeft,
//           child: PopupMenuButton<Duration>(
//             initialValue: controller.value.captionOffset,
//             tooltip: 'Caption Offset',
//             onSelected: (Duration delay) {
//               controller.setCaptionOffset(delay);
//             },
//             itemBuilder: (BuildContext context) {
//               return <PopupMenuItem<Duration>>[
//                 for (final Duration offsetDuration in _exampleCaptionOffsets)
//                   PopupMenuItem<Duration>(
//                     value: offsetDuration,
//                     child: Text('${offsetDuration.inMilliseconds}ms'),
//                   )
//               ];
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 // Using less vertical padding as the text is also longer
//                 // horizontally, so it feels like it would need more spacing
//                 // horizontally (matching the aspect ratio of the video).
//                 vertical: 12,
//                 horizontal: 16,
//               ),
//               child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.topRight,
//           child: PopupMenuButton<double>(
//             initialValue: controller.value.playbackSpeed,
//             tooltip: 'Playback speed',
//             onSelected: (double speed) {
//               controller.setPlaybackSpeed(speed);
//             },
//             itemBuilder: (BuildContext context) {
//               return <PopupMenuItem<double>>[
//                 for (final double speed in _examplePlaybackRates)
//                   PopupMenuItem<double>(
//                     value: speed,
//                     child: Text('${speed}x'),
//                   )
//               ];
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 // Using less vertical padding as the text is also longer
//                 // horizontally, so it feels like it would need more spacing
//                 // horizontally (matching the aspect ratio of the video).
//                 vertical: 12,
//                 horizontal: 16,
//               ),
//               child: Text('${controller.value.playbackSpeed}x'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
