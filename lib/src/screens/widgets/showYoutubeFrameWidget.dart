import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ShowYoutubeFrameWidget extends StatefulWidget {
  final String id;

  ShowYoutubeFrameWidget({this.id});

  @override
  _ShowYoutubeFrameWidgetState createState() => _ShowYoutubeFrameWidgetState();
}

class _ShowYoutubeFrameWidgetState extends State<ShowYoutubeFrameWidget> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      params: const YoutubePlayerParams(
        playlist: [],
        startAt: const Duration(minutes: 0, seconds: 0),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: true,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      log('Exited Fullscreen');
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.load(widget.id);         ////////////   OMG FINALLY
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (kIsWeb && constraints.maxWidth > 800) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: player),
              ],
            );
          }
          return ListView(
            children: [
              player,
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
