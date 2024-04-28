import 'package:audio_player/components/song_header.dart';
import 'package:audio_player/components/song_tile.dart';
import 'package:audio_player/config/colors.dart';
import 'package:audio_player/controller/cloud_song_controller.dart';
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
    RxBool isShymaSong = true.obs;
    RxBool isDurgaSong = false.obs;
    RxBool isSowarsttiSong = false.obs;
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    CloudSongController cloudSongController = Get.put(CloudSongController());
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
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          isShymaSong.value = true;
                          isSowarsttiSong.value = false;
                          isDurgaSong.value = false;
                        },
                        child: Text(
                          'শ্যামা সংগীত',
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: isShymaSong.value ? labelColor : primaryColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isShymaSong.value = false;
                          isSowarsttiSong.value = false;
                          isDurgaSong.value = true;
                        },
                        child: Text(
                          'দুর্গাপূজা সংগীত',
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: isDurgaSong.value ? labelColor : primaryColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isShymaSong.value = false;
                          isSowarsttiSong.value = true;
                          isDurgaSong.value = false;
                        },
                        child: Text(
                          'সরস্বতী সংগীত',
                          style: theme.textTheme.bodySmall!.copyWith(
                            color:
                                isSowarsttiSong.value ? labelColor : primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => isShymaSong.value
                    ? Column(
                        children: cloudSongController.getShymaSongList
                            .map(
                              (e) => SongTile(
                                  songName: e.title!,
                                  onPressed: () {
                                    songPlayerController.playCloudAudio(e);
                                    songDataController
                                        .findCurrentSongPlayingIndex(e.id!);
                                    Get.to(
                                      () => const PlaySongPage(),
                                    );
                                  }),
                            )
                            .toList(),
                      )
                    : (isDurgaSong.value
                        ? Column(
                            children: cloudSongController.getDurgaSongList
                                .map(
                                  (e) => SongTile(
                                      songName: e.title!,
                                      onPressed: () {
                                        songPlayerController.playCloudAudio(e);
                                        songDataController
                                            .findCurrentSongPlayingIndex(e.id!);
                                        Get.to(
                                          () => const PlaySongPage(),
                                        );
                                      }),
                                )
                                .toList(),
                          )
                        : Column(
                            children: cloudSongController.getSowarsttiSongList
                                .map(
                                  (e) => SongTile(
                                      songName: e.title!,
                                      onPressed: () {
                                        songPlayerController.playCloudAudio(e);
                                        songDataController
                                            .findCurrentSongPlayingIndex(e.id!);
                                        Get.to(
                                          () => const PlaySongPage(),
                                        );
                                      }),
                                )
                                .toList(),
                          )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
