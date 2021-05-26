import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/model/music_model.dart';
import 'package:muse_on_sound/src/widget/cover.dart';

class MusicListTile extends StatelessWidget {
  final MusicController _musicController = Get.find();
  final Music _music;

  MusicListTile(this._music);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        color: Colors.white,
        child: Cover(_music.songInfo!.id),
      ),
      title: Text(_music.name,
          style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis),
      subtitle: Text(_music.artistName, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.more_vert_rounded, color: Colors.white),
      onTap: () => _musicController.setSelectedMusic(_music),
    );
  }
}
