import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';

class DetailPage extends StatelessWidget {
  final MusicController _musicController = Get.find();

  final _boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xff234567), Color(0xff6A268D)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        width: double.infinity,
        decoration: _boxDecoration,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Spacer(),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        color: Color(0xff351346),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.repeat, size: 32, color: Colors.white),
            Icon(Icons.shuffle, size: 32, color: Colors.white),
            Icon(Icons.list, size: 32, color: Colors.white),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff234567),
      elevation: 0,
      title: Column(
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
    );
  }
}
