import 'package:audio_player/components/play_song_header_button.dart';
import 'package:audio_player/components/song_and_volume.dart';
import 'package:audio_player/components/song_controller_button.dart';
import 'package:audio_player/components/song_details.dart';
import 'package:flutter/material.dart';

class PlaySongPage extends StatelessWidget {
  const PlaySongPage(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            PlaySongeHeaderButton(),
            SizedBox(
              height: 10,
            ),
            SongAndVolume(),
            SizedBox(
              height: 10,
            ),
            SongDetails(),
            SizedBox(
              height: 10,
            ),
            Spacer(),
            SongControllerButton(),
          ],
        ),
      )),
    );
  }
}
