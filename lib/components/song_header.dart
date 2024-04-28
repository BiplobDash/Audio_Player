import 'package:audio_player/config/colors.dart';
import 'package:audio_player/views/device_song.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SongPageHeader extends StatelessWidget {
  const SongPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/big_logo.svg',
              width: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Pujar Gaan',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
            ),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () => Get.to(() => const DeviceSong(),),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: divColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/music_node.svg',
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Device Song',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
