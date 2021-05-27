import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/track_controller.dart';
import 'package:muse_on_sound/src/widget/track_list_tile.dart';

class PlayTrackPage extends StatelessWidget {
  final TrackController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '재생목록',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(width: 8),
                Text(
                  _controller.trackList.length.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Spacer(),
                Icon(Icons.add, size: 28, color: Colors.white),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      Container(
                        child: TextField(
                          onSubmitted: (v) => _controller.createTrack(v),
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _controller.trackList.length,
                itemBuilder: (context, index) {
                  return TrackListTile(_controller.trackList[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
