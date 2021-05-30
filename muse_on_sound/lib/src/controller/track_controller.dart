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
    update();
  }

  void addMusicOnTrack(SongInfo song) async {
    await selectedTrack.addSong(song: song);
  }

  void removeMusicOnTrack(SongInfo song) async {
    await selectedTrack.removeSong(song: song);
  }

  Future<List<SongInfo>> getSongList(PlaylistInfo track) async {
    return await _audioQuery.getSongsFromPlaylist(playlist: track);
  }
}
