import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/pages/detail_page.dart';

class BottomMusicPlayer extends StatelessWidget {
  final MusicController _musicController = Get.put(MusicController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: Color(0xff351346),
      child: Row(
        children: [
          GestureDetector(
            onTap: goToDetailPage,
            child: Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: goToDetailPage,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _musicController.music.name,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      _musicController.music.artistName,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: IconButton(
              icon: Icon(
                Icons.play_arrow_rounded,
                size: 48,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  void goToDetailPage() {
    Get.to(() => DetailPage());
  }
}
