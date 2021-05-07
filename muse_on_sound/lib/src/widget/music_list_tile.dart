import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/widget/cover.dart';

class MusicListTile extends StatelessWidget {
  final MusicController _musicController = Get.find();
  final SongInfo _songInfo;

  MusicListTile(this._songInfo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        color: Colors.white,
        child: Cover(_songInfo.id),
      ),
      title: Text(_songInfo.title,
          style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis),
      subtitle: Text(_songInfo.artist, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.more_vert_rounded, color: Colors.white),
      onTap: () => _musicController.setSelectedMusic(_songInfo),
    );
  }
}
