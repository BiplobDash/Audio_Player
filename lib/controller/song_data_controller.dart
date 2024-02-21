import 'package:audio_player/controller/song_player_controller.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SongDataController extends GetxController {
  SongPlayerController songPlayerController = Get.put(SongPlayerController());
  final audioQuery = OnAudioQuery();
  RxList<SongModel> localSongList = <SongModel>[].obs;
  RxBool isDeviceSong = false.obs;
  RxInt currentSongPlayingIndex = 0.obs;

  @override
  void onInit() {
    storagePermission();
    super.onInit();
  }

  void getLocalSongs() async {
    localSongList.value = await audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );
  }

  void storagePermission() async {
    try {
      var perm = await Permission.storage.request();
      if (perm.isGranted) {
        getLocalSongs();
      } else {
        await Permission.storage.request();
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  void findCurrentSongPlayingIndex(int songId) async {
    var index = 0;
    for (var e in localSongList) {
      if (e.id == songId) {
        currentSongPlayingIndex.value = index;
      }
      index++;
    }
  }

  void playNextSong() async {
    int songListLen = localSongList.length;
    currentSongPlayingIndex.value = currentSongPlayingIndex.value + 1;
    if (currentSongPlayingIndex.value < songListLen) {
      SongModel nextSong = localSongList[currentSongPlayingIndex.value];
      songPlayerController.playLocalAudio(nextSong);
    }
  }

  void playPreviousSong() async {
    int songListLen = localSongList.length;
    if (currentSongPlayingIndex.value != 0) {
      currentSongPlayingIndex.value = --currentSongPlayingIndex.value;
      if (currentSongPlayingIndex.value < songListLen) {
        SongModel nextSong = localSongList[currentSongPlayingIndex.value];
        songPlayerController.playLocalAudio(nextSong);
      }
    }
  }
}
