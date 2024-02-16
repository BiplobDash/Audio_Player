import 'package:audio_player/components/song_header.dart';
import 'package:audio_player/components/song_slider.dart';
import 'package:audio_player/components/song_tile.dart';
import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cloud Song',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  'Device Song',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SongTile(),
            const SongTile(),
            const SongTile(),
            const SongTile(),
          ],
        ),
      ),),
    );
  }
}
