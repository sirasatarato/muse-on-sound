import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/model/music_model.dart';
import 'package:muse_on_sound/src/widget/cover.dart';

class MusicListTile extends StatelessWidget {
  final MusicController _musicController = Get.find();
  final List<Music> _music;
  final int index;

  MusicListTile(this._music, this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        color: Colors.white,
        child: Cover(_music[index].songInfo!.id),
      ),
      title: Text(
        _music[index].name,
        style: TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle:
          Text(_music[index].artistName, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.more_vert_rounded, color: Colors.white),
      onTap: () {
        _musicController.musicList = _music;
        _musicController.setSelectedMusic(_music[index]);
      },
    );
  }
}
