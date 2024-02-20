import 'package:audio_player/config/colors.dart';
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('02:30'),
            const Text('/'),
            Text(
              '02:30',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              'assets/icons/back.svg',
              width: 20,
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
            SvgPicture.asset(
              'assets/icons/next.svg',
              width: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              'assets/icons/suffle.svg',
              width: 20,
            ),
            SvgPicture.asset(
              'assets/icons/repeat.svg',
              width: 20,
            ),
            SvgPicture.asset(
              'assets/icons/songbook.svg',
              width: 20,
            ),
            SvgPicture.asset(
              'assets/icons/heart.svg',
              width: 20,
            ),
          ],
        )
      ],
    );
  }
}
