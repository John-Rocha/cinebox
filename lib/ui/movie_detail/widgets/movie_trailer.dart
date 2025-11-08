import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailer extends StatefulWidget {
  final String videoId;
  const MovieTrailer({required this.videoId, super.key});

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  late YoutubePlayerController _youtubePlayerController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        const Text('Trailer', style: AppTextStyles.boldMedium),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.hardEdge,
            child: Visibility(
              visible: _isPlaying,
              replacement: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPlaying = true;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      YoutubePlayer.getThumbnail(
                        videoId: widget.videoId,
                        quality: ThumbnailQuality.medium,
                      ),
                      fit: BoxFit.cover,
                    ),
                    Icon(
                      Icons.play_circle_fill,
                      size: 64,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              child: YoutubePlayer(controller: _youtubePlayerController),
            ),
          ),
        ),
      ],
    );
  }
}
