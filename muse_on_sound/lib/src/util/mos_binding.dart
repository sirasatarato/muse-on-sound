import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';
import 'package:muse_on_sound/src/controller/nav_controller.dart';

class MosBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MusicController>(MusicController());
    Get.put<NavController>(NavController());
  }
}