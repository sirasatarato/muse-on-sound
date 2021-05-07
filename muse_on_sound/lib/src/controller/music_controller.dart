import 'package:get/get.dart';
import 'package:muse_on_sound/src/model/music_model.dart';

class MusicController extends GetxController {
  final _music = Music('Life is PIANO', 'Junk', '').obs;

  Music get music => _music.value;
}