import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/controller/track_controller.dart';
import 'package:muse_on_sound/src/model/music_model.dart';
import 'package:muse_on_sound/src/widget/cover.dart';
import 'package:muse_on_sound/src/widget/gradient_wrapper.dart';
import 'package:muse_on_sound/src/widget/music_list_tile.dart';

class TrackDetailPage extends StatelessWidget {
  final TrackController _trackController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientWrapper(
        child: Container(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: FutureBuilder(
              future:
                  _trackController.getSongList(_trackController.selectedTrack),
              builder: (context, AsyncSnapshot<List<SongInfo>> snapshot) {
                if (!snapshot.hasData) return Container();

                var list = snapshot.data!
                    .map((e) => Music(e.title, e.artist, songInfo: e))
                    .toList();

                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (context, index) => MusicListTile(list, index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
