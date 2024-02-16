import 'package:audio_player/config/theme.dart';
import 'package:flutter/material.dart';

import 'views/song_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const SongPage(),
    );
  }
}
