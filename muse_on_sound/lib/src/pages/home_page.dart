import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/widget/music_list_tile.dart';
import 'package:muse_on_sound/src/widget/search.dart';

class HomePage extends StatelessWidget {
  final MusicController _musicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 10),
      child: Column(
        children: [
          Search(),
          SizedBox(height: 8),
          Expanded(child: buildMusicListView()),
          SizedBox(height: 90),
        ],
      ),
    );
  }

  NotificationListener<OverscrollIndicatorNotification> buildMusicListView() {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _musicController.allMusicList.length,
        itemBuilder: (context, index) {
          return MusicListTile(_musicController.allMusicList, index);
        },
      ),
    );
  }
}
