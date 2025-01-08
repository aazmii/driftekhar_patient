import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final urls = [
  'https://www.youtube.com/watch?v=5jAnClVI2ts&list=PLxOr1HN5uNzllwsxdt2PVAQQrggaQ9Z6R&index=7',
  'https://www.youtube.com/watch?v=vpowzm9dyTo',
  'https://www.youtube.com/watch?v=_QTz4JV5uM8',
  'https://www.youtube.com/watch?v=yNU0El3CWWY',
  'https://www.youtube.com/watch?v=OCHgE9FevLQ',
];

class YtVideoList extends StatelessWidget {
  const YtVideoList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        urls.length,
        (i) {
          final videoId = YoutubePlayer.convertUrlToId(urls[i]);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      insetPadding: EdgeInsets.zero,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                              )),
                          PlayerWidget(videoId: videoId),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Image.network(
                YoutubePlayer.getThumbnail(videoId: videoId!),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : const Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({super.key, required this.videoId});
  final String videoId;

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  late final YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: context.theme.primaryColor,
        ),
      ),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.red,
        ),
        // onReady: () {
        //   _controller.addListener(listener);
        // },
      ),
    );
  }
}
