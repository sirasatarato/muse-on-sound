import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/widget/bottom_music_player.dart';
import 'package:muse_on_sound/src/widget/music_list_tile.dart';
import 'package:muse_on_sound/src/widget/search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Search(),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder: (context, index) {
                return MusicListTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}
