import 'package:audio_player/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlaySongeHeaderButton extends StatelessWidget {
  const PlaySongeHeaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: divColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SvgPicture.asset('assets/icons/back_page.svg'),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: divColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SvgPicture.asset('assets/icons/setting.svg'),
          ),
        )
      ],
    );
  }
}