import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentTime = '0'.obs;
  RxString totalTime = '0'.obs;
  RxDouble silderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songTitle = ''.obs;
  RxString songArtist = ''.obs;
  RxBool isLoop = false.obs;
  RxBool isSuffle = false.obs;
  RxDouble volumeLavel = 0.0.obs;

  void playLocalAudio(SongModel song) async {
    songTitle.value = song.title;
    songArtist.value = song.artist!;
    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(song.data),
      ),
    );
    player.play();
    updatePosition();
    isPlaying.value = true;
  }

  void resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  void pausePlaying() async {
    isPlaying.value = false;
    await player.pause();
  }

  void setLoopSong() async {
    if (isLoop.value) {
      await player.setLoopMode(LoopMode.off);
    } else {
      await player.setLoopMode(LoopMode.one);
    }
    isLoop.value = !isLoop.value;
  }

  void playRandomSong() async {
    if (isSuffle.value) {
      await player.setShuffleModeEnabled(false);
    } else {
      await player.setShuffleModeEnabled(true);
    }
    isSuffle.value = !isSuffle.value;
  }

  void changeSongSlider(Duration position) async {
    player.seek(position);
  }

  void updatePosition() async {
    try {
      player.durationStream.listen((d) {
        totalTime.value = d.toString().split(".")[0];
        sliderMaxValue.value = d!.inSeconds.toDouble();
      });
      player.positionStream.listen((p) {
        currentTime.value = p.toString().split(".")[0];
        silderValue.value = p.inSeconds.toDouble();
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  void changeVolume(double value) {
    volumeLavel.value = value;
    player.setVolume(volumeLavel.value);
  }
}
