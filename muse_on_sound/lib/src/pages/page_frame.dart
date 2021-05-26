import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/nav_controller.dart';
import 'package:muse_on_sound/src/pages/home_page.dart';
import 'package:muse_on_sound/src/pages/play_track_page.dart';
import 'package:muse_on_sound/src/widget/bottom_music_player.dart';
import 'package:muse_on_sound/src/widget/gradient_wrapper.dart';

class PageFrame extends StatelessWidget {
  final NavController _navController = Get.find();
  final List<Widget> bodyContent = [
    HomePage(),
    Container(),
    PlayTrackPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientWrapper(
        child: Stack(
          children: [
            Obx(() => bodyContent[_navController.selectedIndex]),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomMusicPlayer(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 6, 24, 24),
      color: Color(0xff351346),
      child: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Obx(
            () => BottomNavigationBar(
              currentIndex: _navController.selectedIndex,
              onTap: (index) => _navController.selectedIndex = index,
              elevation: 0,
              backgroundColor: Colors.black,
              selectedItemColor: Get.theme.accentColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
