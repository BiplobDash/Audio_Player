import 'package:audio_player/controller/song_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/play_outline.svg'),
            const SizedBox(
              width: 10,
            ),
            Text(
              '210 plays',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Flexible(
                child: Text(
                  songPlayerController.songTitle.value,
                  maxLines: 1,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/download.svg',
              width: 25,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => Row(
            children: [
              Flexible(
                child: Text(
                  songPlayerController.songArtist.value,
                  maxLines: 1,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
