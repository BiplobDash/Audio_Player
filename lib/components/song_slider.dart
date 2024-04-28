import 'package:audio_player/components/song_tile.dart';
import 'package:audio_player/config/colors.dart';
import 'package:audio_player/controller/song_data_controller.dart';
import 'package:audio_player/controller/song_player_controller.dart';
import 'package:audio_player/views/play_song_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SongSlider extends StatelessWidget {
  const SongSlider({super.key});

  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    List<Widget> sliderItem = songDataController.localSongList
        .map(
          (e) => Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: divColor,
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                image: AssetImage('assets/images/cover.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        SongTile(
                            songName: e.title,
                            onPressed: () {
                              songPlayerController.playLocalAudio(e);
                              songDataController
                                  .findCurrentSongPlayingIndex(e.id);
                              Get.to(() => const PlaySongPage());
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: divColor,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/music_node.svg'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Device Song',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        e.title,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      e.artist!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: labelColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
        .toList();
    return CarouselSlider(
      items: sliderItem,
      options: CarouselOptions(
        height: 320,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, value) {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
