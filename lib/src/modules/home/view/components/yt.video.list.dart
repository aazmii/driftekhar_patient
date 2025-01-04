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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerWidget(videoId: videoId),
                  ),
                );
              },
              child: Image.network(
                width: 120,
                YoutubePlayer.getThumbnail(videoId: videoId!),
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
    return Scaffold(
      appBar: AppBar(),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        // onReady: () {
        //   _controller.addListener(listener);
        // },
      ),
    );
  }
}
