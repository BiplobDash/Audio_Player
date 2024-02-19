import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            Text(
              'O Radhe O Radhe',
              style: theme.textTheme.bodyLarge,
            ),
            SvgPicture.asset('assets/icons/download.svg', width: 25,),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              'Suili',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
