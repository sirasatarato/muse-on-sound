import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/widget/cover.dart';
import 'package:muse_on_sound/src/widget/gradient_wrapper.dart';

class DetailPage extends StatelessWidget {
  final MusicController _musicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GradientWrapper(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Obx(() => buildMusicCover()),
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomControlBar(),
    );
  }

  SizedBox buildMusicCover() {
    return SizedBox(
      width: 200,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Cover(_musicController.selectedMusic.cover ?? ''),
      ),
    );
  }

  Container buildBottomControlBar() {
    return Container(
      height: Get.height / 11,
      color: Color(0xff351346),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.repeat, size: 32, color: Colors.white),
          Icon(Icons.shuffle, size: 32, color: Colors.white),
          Icon(Icons.list, size: 32, color: Colors.white),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff123456),
      centerTitle: true,
      elevation: 0,
      title: Column(
        children: [
          Text(
            _musicController.selectedMusic.name,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            _musicController.selectedMusic.artistName,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
