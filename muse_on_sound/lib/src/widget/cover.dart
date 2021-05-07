import 'dart:typed_data';

import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/controller/music_controller.dart';

class Cover extends StatelessWidget {
  final MusicController _musicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FutureBuilder(
        future: FlutterAudioQuery().getArtwork(
          type: ResourceType.SONG,
          id: _musicController.selectedMusic.cover,
        ),
        builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.isNotEmpty) {
            return Image.memory(snapshot.data!, fit: BoxFit.cover);
          }

          return Container(color: Colors.white);
        },
      ),
    );
  }
}
