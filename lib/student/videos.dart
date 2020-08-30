import 'package:digishala/constants.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class Videos extends StatefulWidget {
  static const String id = 'videos';
  final String link;
  Videos({Key key, @required this.link}) : super(key: key);
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  String vidURL = 'https://www.youtube.com/watch?v=1Q-pLDEn9VM';

  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.link),
      flags: YoutubePlayerFlags(autoPlay: true),
    );

    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Watch Videos"),
        //   centerTitle: true,
        //   backgroundColor: kThemeColor,
        // ),
        body: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: YoutubePlayer(controller: _controller),
    ));
  }
}
