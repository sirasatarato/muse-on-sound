import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/pages/detail_page.dart';
import 'package:muse_on_sound/src/widget/cover.dart';

class BottomMusicPlayer extends StatelessWidget {
  final MusicController _musicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: Color(0xff351346),
      child: Obx(
        () => Row(
          children: [
            buildCover(),
            Expanded(child: buildSongInfo()),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: buildPlayButton(),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildCover() {
    return GestureDetector(
      onTap: goToDetailPage,
      child: SizedBox(
        height: 66,
        width: 66,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Cover(_musicController.selectedMusic.cover ?? ''),
        ),
      ),
    );
  }

  GestureDetector buildSongInfo() {
    var tp = TextPainter(
      text: TextSpan(text: _musicController.selectedMusic.name),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(maxWidth: Get.width - 146);

    return GestureDetector(
      onTap: goToDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: tp.didExceedMaxLines
                  ? Marquee(
                      scrollAxis: Axis.horizontal,
                      blankSpace: 20,
                      velocity: 80.0,
                      pauseAfterRound: Duration(seconds: 1),
                      text: _musicController.selectedMusic.name,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )
                  : Text(
                      _musicController.selectedMusic.name,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
            ),
            Text(
              _musicController.selectedMusic.artistName,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  IconButton buildPlayButton() {
    return IconButton(
      icon: Icon(
        Icons.play_arrow_rounded,
        size: 48,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }

  void goToDetailPage() {
    Get.to(() => DetailPage());
  }
}
