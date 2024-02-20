import 'package:audio_player/config/theme.dart';
import 'package:audio_player/views/song_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Audio Player',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const SongPage(),
    );
  }
}
