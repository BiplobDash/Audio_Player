import 'package:audio_player/config/theme.dart';
import 'package:audio_player/firebase_options.dart';
import 'package:audio_player/views/song_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
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
