import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/controller/track_controller.dart';
import 'package:muse_on_sound/src/model/music_model.dart';
import 'package:muse_on_sound/src/pages/track_detail_page.dart';
import 'package:muse_on_sound/src/widget/cover.dart';

class TrackListTile extends StatelessWidget {
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
        icon: Icon(Icons.more_vert_rounded, color: Colors.white),
        onPressed: () {

        },
      ),
      onTap: () {
        _trackController.selectedTrack = _track;
        Get.to(() => TrackDetailPage());
      },
    );
  }
}
