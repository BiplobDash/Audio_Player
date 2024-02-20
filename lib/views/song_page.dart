import 'package:audio_player/components/song_header.dart';
import 'package:audio_player/components/song_slider.dart';
import 'package:audio_player/components/song_tile.dart';
import 'package:audio_player/config/colors.dart';
import 'package:audio_player/controller/song_data_controller.dart';
import 'package:audio_player/controller/song_player_controller.dart';
import 'package:audio_player/views/play_song_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SongPageHeader(),
              const SizedBox(
                height: 20,
              ),
              const SongSlider(),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        songDataController.isDeviceSong.value = false;
                      },
                      child: Text(
                        'Cloud Song',
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: songDataController.isDeviceSong.value
                              ? labelColor
                              : primaryColor,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        songDataController.isDeviceSong.value = true;
                      },
                      child: Text(
                        'Device Song',
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: songDataController.isDeviceSong.value
                              ? primaryColor
                              : labelColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => songDataController.isDeviceSong.value
                    ? Column(
                        children: songDataController.localSongList
                            .map(
                              (e) => SongTile(
                                  songName: e.title,
                                  onPressed: () {
                                    songPlayerController.playLocalAudio(e.data);
                                    Get.to(() => const PlaySongPage());
                                  }),
                            )
                            .toList(),
                      )
                    : const Column(
                        children: [],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
