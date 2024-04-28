import 'dart:developer';

import 'package:audio_player/views/model/my_song_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CloudSongController extends GetxController {
  final db = FirebaseFirestore.instance;

  RxList<MySongModel> getShymaSongList = RxList<MySongModel>([]);
  RxList<MySongModel> getDurgaSongList = RxList<MySongModel>([]);
  RxList<MySongModel> getSowarsttiSongList = RxList<MySongModel>([]);

  // Song Upload in Firebase Firestore Database
  void uploadSongToDb() async {
    MySongModel newSong = MySongModel(
      id: 1,
      title: "বরদে বরদে বীণা",
      artist: "Unknown",
      album: "সরস্বতী স্পেশাল সংগীত",
      albumArt:
          "https://firebasestorage.googleapis.com/v0/b/vedic-music-2e696.appspot.com/o/images%2FssPuja.jpg?alt=media&token=85765ecc-a1d2-44c7-9644-2a9db49fbeb1",
      data:
          "https://firebasestorage.googleapis.com/v0/b/vedic-music-2e696.appspot.com/o/%E0%A6%B8%E0%A6%B0%E0%A6%B8%E0%A7%8D%E0%A6%AC%E0%A6%A4%E0%A7%80%20%E0%A6%AA%E0%A7%82%E0%A6%9C%E0%A6%BE%2F%E0%A6%AC%E0%A6%B0%E0%A6%A6%E0%A7%87%20%E0%A6%AC%E0%A6%B0%E0%A6%A6%E0%A7%87%20%E0%A6%AC%E0%A7%80%E0%A6%A3%E0%A6%BE%20%E0%A6%AC%E0%A6%BE%E0%A6%A6%E0%A6%BF%E0%A6%A8%E0%A7%80%20-%20Saraswati%20Vandana%20Mekhla%20Dasgupta%20SVF%20Devotional%20(320%20kbps).mp3?alt=media&token=7aa25c9b-a02c-475f-8615-61e4146453db",
    );
    await db.collection("Sorwastti Puja Sangeet").add(
          newSong.toJson(),
        );
    log("Sorwastti Puja Upload");
  }

  void getShymaSong() async {
    getShymaSongList.clear();
    await db.collection("Shyama Sangeet").get().then((value) {
      for (var element in value.docs) {
        getShymaSongList.add(MySongModel.fromJson(element.data()));
      }
    });
  }

  void getSorwasttiSong() async {
    getSowarsttiSongList.clear();
    await db.collection("Sorwastti Puja Sangeet").get().then((value) {
      for (var element in value.docs) {
        getSowarsttiSongList.add(MySongModel.fromJson(element.data()));
      }
    });
  }

  void getDurgaSong() async {
    getDurgaSongList.clear();
    await db.collection("Durga Puja Sangeet").get().then((value) {
      for (var element in value.docs) {
        getDurgaSongList.add(MySongModel.fromJson(element.data()));
      }
    });
  }

  @override
  void onInit() {
    getDurgaSong();
    getShymaSong();
    getSorwasttiSong();
    super.onInit();
  }
}
