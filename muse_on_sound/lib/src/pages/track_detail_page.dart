import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/track_controller.dart';
import 'package:muse_on_sound/src/model/music_model.dart';
import 'package:muse_on_sound/src/widget/gradient_wrapper.dart';
import 'package:muse_on_sound/src/widget/music_list_tile.dart';

class TrackDetailPage extends StatelessWidget {
  final TrackController _trackController = Get.find();
  final dropdownValue = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientWrapper(
        child: FutureBuilder(
          future: _trackController.getSongList(_trackController.selectedTrack),
          builder: (_, AsyncSnapshot<List<SongInfo>> snapshot) {
            return Column(
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height * 0.2,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _trackController.selectedTrack.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 44,
                            ),
                          ),
                          Text(
                            '수록곡: ' +
                                (snapshot.hasData
                                    ? snapshot.data?.length.toString() ??
                                        '0'
                                    : '0'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: Get.height * 0.8,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowGlow();
                      return true;
                    },
                    child: buildFutureBuilder(snapshot),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildFutureBuilder(AsyncSnapshot<List<SongInfo>> snapshot) {
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
  }
}
