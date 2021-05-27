// ignore: import_of_legacy_library_into_null_safe
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/model/music_model.dart';

enum Repeat { NONE, REPEAT, ONE }

class MusicController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  final _selectedMusic = Music('Unknown', '<Unknown>').obs;
  final _musicList = <Music>[].obs;
  late var _allMusicList = <Music>[];
  final _isPlay = false.obs;
  final _isShuffle = false.obs;
  final _isRepeat = Repeat.NONE.obs;
  final _progressValue = Duration().obs;

  MusicController() {
    audioPlayer.onPlayerCompletion.listen((event) {
      switch (isRepeat) {
        case Repeat.REPEAT:
          getNextMusic();
          break;
        case Repeat.ONE:
          setSelectedMusic(selectedMusic);
          break;
        case Repeat.NONE:
          break;
      }
    });

    FlutterAudioQuery().getSongs().then((value) {
      var list =
          value.map((e) => Music(e.title, e.artist, songInfo: e)).toList();
      _allMusicList = list;
      musicList = list;
    });
  }

  List<Music> get allMusicList => _allMusicList;

  Music get selectedMusic => _selectedMusic.value;

  List<Music> get musicList => _musicList;

  set musicList(List<Music> value) => _musicList.value = value;

  bool get isPlay => _isPlay.value;

  set isPlay(bool value) => _isPlay.value = value;

  bool get isShuffle => _isShuffle.value;

  set isShuffle(bool value) => _isShuffle.value = value;

  Repeat get isRepeat => _isRepeat.value;

  set isRepeat(Repeat value) => _isRepeat.value = value;

  Duration get progressValue => _progressValue.value;

  set progressValue(Duration value) => _progressValue.value = value;

  void setSelectedMusic(Music music) async {
    _selectedMusic.value = music;

    await audioPlayer.play(music.songInfo!.filePath, isLocal: true);

    isPlay = true;
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      if (p.inMilliseconds.toDouble() > 0 &&
          selectedMusic.getDuration() > p.inMilliseconds.toDouble()) {
        progressValue = p;
      }
    });
  }

  void playLocal() {
    if (_selectedMusic.value.songInfo == null) return;

    if (isPlay = !isPlay) {
      audioPlayer.resume();
    } else {
      audioPlayer.pause();
    }
  }

  void seekTo(double value) async {
    await audioPlayer.pause();
    await audioPlayer
        .seek(progressValue = Duration(milliseconds: value.toInt()));
    await audioPlayer.resume();
  }

  double? progressValueToDouble() {
    return min(
      progressValue.inMilliseconds.toDouble(),
      selectedMusic.getDuration(),
    );
  }

  double progress() => progressValue.inMilliseconds.toDouble();

  void getNextMusic() {
    var songInfo = _selectedMusic.value.songInfo;
    var data = List.from(musicList);
    if (isShuffle) data.shuffle();

    var index = data.indexWhere((e) => e == songInfo) + 1;
    if (musicList.length == index && isRepeat == Repeat.REPEAT) index = 0;
    setSelectedMusic(musicList[index]);
  }

  @override
  void dispose() {
    audioPlayer.release();
    super.dispose();
  }
}
