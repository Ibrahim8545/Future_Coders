import 'package:courseapp/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key, required this.youtubeUrl});

  final String youtubeUrl;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);
     controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black500,
      body: Center(
        child: YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                liveUIColor: ColorManager.red600,
                progressIndicatorColor: Colors.grey,
                onReady: () => debugPrint("Ready"),
          bottomActions: const [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.redAccent,
              ),
            ),
            PlaybackSpeedButton(),
            FullScreenButton(),
            PlaybackSpeedButton(),
            PlayPauseButton(),
            RemainingDuration(),
          ],
              ),
      ),
    );
  }
}
