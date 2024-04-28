import 'package:audio_player/controller/song_player_controller.dart';
import 'package:flutter/material.dart';
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
