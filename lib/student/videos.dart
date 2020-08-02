import 'package:digishala/constants.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos extends StatefulWidget {
  static const String id = 'videos';
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  String vidURL = 'https://www.youtube.com/watch?v=1Q-pLDEn9VM';

  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(vidURL),
      flags: YoutubePlayerFlags(autoPlay: false),
    );

    super.initState();
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
      decoration: kContainerThemeDecoration,
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(190),
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Demo Video',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  shadowColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  margin: EdgeInsets.all(5.0),
                  child: YoutubePlayer(controller: _controller),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
