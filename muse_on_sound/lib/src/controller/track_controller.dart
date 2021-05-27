// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';

class TrackController extends GetxController {
  final _audioQuery = FlutterAudioQuery();
  final _trackList = <PlaylistInfo>[].obs;
  Rx<PlaylistInfo>? _selectedTrack;

  TrackController() {
    _audioQuery.getPlaylists().then((value) => _trackList.addAll(value));
  }

  List<PlaylistInfo> get trackList => _trackList;

  PlaylistInfo get selectedTrack => _selectedTrack!.value;

  set selectedTrack(PlaylistInfo value) => _selectedTrack = value.obs;

  void createTrack(String name) async {
    _trackList.add(await FlutterAudioQuery.createPlaylist(playlistName: name));
  }

  void addMusicOnTrack(PlaylistInfo track, SongInfo song) async {
    await track.addSong(song: song);
  }

  void removeMusicOnTrack(PlaylistInfo track, SongInfo song) async {
    await track.removeSong(song: song);
  }

  Future<List<SongInfo>> getSongList(PlaylistInfo track) async {
    return await _audioQuery.getSongsFromPlaylist(playlist: track);
  }
}
