import 'package:audio_player/components/song_tile.dart';
import 'package:audio_player/controller/song_data_controller.dart';
import 'package:audio_player/controller/song_player_controller.dart';
import 'package:audio_player/views/play_song_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceSong extends StatelessWidget {
  const DeviceSong({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Device Song",
          style: theme.textTheme.labelLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: songDataController.localSongList
              .map(
                (e) => SongTile(
                    songName: e.title,
                    onPressed: () {
                      songPlayerController.playLocalAudio(e);
                      songDataController.findCurrentSongPlayingIndex(e.id);
                      Get.to(() => const PlaySongPage());
                    }),
              )
              .toList(),
        ),
      ),
    );
  }
}
