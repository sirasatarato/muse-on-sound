// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/model/music_model.dart';

class MusicController extends GetxController {
  final _selectedMusic = Music('Unknown', '<Unknown>').obs;
  final _musicList = <SongInfo>[].obs;

  MusicController() {
    FlutterAudioQuery().getSongs().then((value) {
      print('find music: ${value.length}');
      value.map((e) => e.title).forEach(print);
      _musicList.value = value;
    });
  }

  // ignore: invalid_use_of_protected_member
  List<SongInfo> get musicList => _musicList.value;

  Music get selectedMusic => _selectedMusic.value;

  void setSelectedMusic(SongInfo songInfo) {
    _selectedMusic.value =
        Music(songInfo.title, songInfo.artist, cover: songInfo.id);
  }
}
