// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Music {
  final String name;
  final String artistName;
  final SongInfo? songInfo;

  Music(this.name, this.artistName, {this.songInfo});

  double getDuration() => double.parse(songInfo!.duration);
}