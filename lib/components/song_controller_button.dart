import 'package:audio_player/config/colors.dart';
import 'package:audio_player/controller/song_data_controller.dart';
import 'package:audio_player/controller/song_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SongControllerButton extends StatelessWidget {
  const SongControllerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    SongDataController songDataController = Get.put(SongDataController());
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                songPlayerController.currentTime.value,
                style: theme.textTheme.bodySmall,
              ),
              Expanded(
                child: Obx(() => Slider(
                      value: songPlayerController.silderValue.value
                          .clamp(0.0, songPlayerController.silderValue.value),
                      onChanged: (value) {
                        songPlayerController.silderValue.value = value;
                        Duration songPosition = Duration(
                          seconds: value.toInt(),
                        );
                        songPlayerController.changeSongSlider(songPosition);
                      },
                      min: 0,
                      max: songPlayerController.sliderMaxValue.value,
                    )),
              ),
              Text(
                songPlayerController.totalTime.value,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                songDataController.playPreviousSong();
              },
              child: SvgPicture.asset(
                'assets/icons/back.svg',
                width: 20,
              ),
            ),
            Obx(
              () => songPlayerController.isPlaying.value
                  ? InkWell(
                      onTap: () {
                        songPlayerController.pausePlaying();
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/pause.svg',
                            width: 20,
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        songPlayerController.resumePlaying();
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/play.svg',
                            width: 20,
                          ),
                        ),
                      ),
                    ),
            ),
            InkWell(
              onTap: () {
                songDataController.playNextSong();
              },
              child: SvgPicture.asset(
                'assets/icons/next.svg',
                width: 20,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () => InkWell(
                onTap: () {
                  songPlayerController.playRandomSong();
                },
                child: SvgPicture.asset(
                  'assets/icons/suffle.svg',
                  width: 20,
                  // ignore: deprecated_member_use
                  color: songPlayerController.isSuffle.value
                      ? primaryColor
                      : labelColor,
                ),
              ),
            ),
            Obx(() => InkWell(
                  onTap: () {
                    songPlayerController.setLoopSong();
                  },
                  child: SvgPicture.asset(
                    'assets/icons/repeat.svg',
                    width: 20,
                    // ignore: deprecated_member_use
                    color: songPlayerController.isLoop.value
                        ? primaryColor
                        : labelColor,
                  ),
                )),
            // SvgPicture.asset(
            //   'assets/icons/songbook.svg',
            //   width: 20,
            // ),
            // SvgPicture.asset(
            //   'assets/icons/heart.svg',
            //   width: 20,
            // ),
          ],
        )
      ],
    );
  }
}
