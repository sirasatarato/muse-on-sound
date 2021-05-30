import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/controller/track_controller.dart';
import 'package:muse_on_sound/src/model/music_model.dart';
import 'package:muse_on_sound/src/pages/track_detail_page.dart';
import 'package:muse_on_sound/src/widget/cover.dart';

import 'music_list_tile.dart';

class TrackListTile extends StatelessWidget {
  final MusicController _musicController = Get.find();
  final TrackController _trackController = Get.find();
  final PlaylistInfo _track;

  TrackListTile(this._track);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        color: Colors.white,
        child: FutureBuilder(
          future: _trackController.getSongList(_track),
          builder: (context, AsyncSnapshot<List<SongInfo>> snapshot) {
            if (snapshot.data?.isEmpty ?? true) return Cover('');

            return Cover(snapshot.data?.first.id ?? '');
          },
        ),
      ),
      title: Text(
        _track.name,
        style: TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(_track.creationDate, style: TextStyle(color: Colors.grey)),
      trailing: IconButton(
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _trackController.selectedTrack = _track;
          showMusicList();
        },
      ),
      onTap: () {
        _trackController.selectedTrack = _track;
        Get.to(() => TrackDetailPage());
      },
    );
  }

  void showMusicList() {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
        ),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: _musicController.musicList.length,
            itemBuilder: (context, index) {
              return buildListTile(_musicController.musicList, index);
            },
          ),
        ),
      ),
      barrierColor: Colors.white.withOpacity(0),
    );
  }

  Widget buildListTile(List<Music> music, int index) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        color: Colors.white,
        child: Cover(music[index].songInfo!.id),
      ),
      title: Text(
        music[index].name,
        style: TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        music[index].artistName,
        style: TextStyle(color: Colors.grey),
      ),
      onTap: () {
        _trackController.addMusicOnTrack(
          _musicController.musicList[index].songInfo!,
        );
      },
    );
  }
}
