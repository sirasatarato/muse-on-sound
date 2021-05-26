import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/widget/cover.dart';
import 'package:muse_on_sound/src/widget/gradient_wrapper.dart';
import 'package:muse_on_sound/src/widget/music_list_tile.dart';

class DetailPage extends StatelessWidget {
  final MusicController _musicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GradientWrapper(
        child: Column(
          children: [
            buildMusicCover(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() => buildMusicSeeker()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: SizedBox(
                width: Get.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPreviousMusic(),
                    SizedBox(child: buildPlayButton()),
                    buildNextMusic(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomControlBar(),
    );
  }

  Padding buildMusicCover() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: SizedBox(
        width: 200,
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Obx(
            () => Cover(_musicController.selectedMusic.songInfo?.id ?? ''),
          ),
        ),
      ),
    );
  }

  IconButton buildNextMusic() {
    return IconButton(
      icon: Icon(
        Icons.skip_next,
        color: Colors.white,
      ),
      iconSize: 48,
      onPressed: _musicController.getNextMusic,
    );
  }

  IconButton buildPlayButton() {
    return IconButton(
      icon: Obx(
        () => Icon(
          _musicController.isPlay ? Icons.pause : Icons.play_arrow_rounded,
          color: Get.theme.accentColor,
        ),
      ),
      iconSize: 96,
      onPressed: _musicController.playLocal,
    );
  }

  IconButton buildPreviousMusic() {
    return IconButton(
      icon: Icon(
        Icons.skip_previous,
        color: Colors.white,
      ),
      iconSize: 48,
      onPressed: () => _musicController.seekTo(0),
    );
  }

  Slider buildMusicSeeker() {
    return Slider(
      value: _musicController.progressValueToDouble() ?? 0,
      onChanged: _musicController.seekTo,
      min: 0,
      max: _musicController.selectedMusic.getDuration(),
      activeColor: Get.theme.accentColor,
      inactiveColor: Colors.white,
    );
  }

  Container buildBottomControlBar() {
    return Container(
      height: Get.height / 11,
      color: Color(0xff351346),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildRepeatMusic(),
          buildRandomMusic(),
          showMusicList(),
        ],
      ),
    );
  }

  IconButton buildRepeatMusic() {
    return IconButton(
      icon: Obx(
        () => Icon(
          _musicController.isRepeat == Repeat.ONE
              ? Icons.repeat_one
              : Icons.repeat,
          color: _musicController.isRepeat == Repeat.NONE
              ? Colors.white
              : Get.theme.accentColor,
        ),
      ),
      iconSize: 32,
      onPressed: () {
        switch (_musicController.isRepeat) {
          case Repeat.NONE:
            _musicController.isRepeat = Repeat.REPEAT;
            break;
          case Repeat.REPEAT:
            _musicController.isRepeat = Repeat.ONE;
            break;
          case Repeat.ONE:
            _musicController.isRepeat = Repeat.NONE;
            break;
        }
      },
    );
  }

  IconButton buildRandomMusic() {
    return IconButton(
      icon: Obx(
        () => Icon(
          Icons.shuffle,
          color: _musicController.isShuffle
              ? Get.theme.accentColor
              : Colors.white,
        ),
      ),
      iconSize: 32,
      onPressed: () =>
          _musicController.isShuffle = !_musicController.isShuffle,
    );
  }

  IconButton showMusicList() {
    return IconButton(
      icon: Icon(
        Icons.list,
        color: Colors.white,
      ),
      iconSize: 32,
      onPressed: () {
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
                  return MusicListTile(_musicController.musicList[index]);
                },
              ),
            ),
          ),
          barrierColor: Colors.white.withOpacity(0),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff123456),
      centerTitle: true,
      elevation: 0,
      title: Obx(
        () => Column(
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
      ),
    );
  }
}
