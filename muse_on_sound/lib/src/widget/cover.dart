import 'dart:typed_data';

import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Cover extends StatelessWidget {
  final String id;

  const Cover(this.id);

  @override
  Widget build(BuildContext context) {
    if (id.isEmpty) {
      return Container(color: Colors.white);
    }

    return FutureBuilder(
      future: FlutterAudioQuery().getArtwork(
        type: ResourceType.SONG,
        id: id,
      ),
      builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          return Image.memory(snapshot.data!, fit: BoxFit.cover);
        }

        return Container(color: Colors.white);
      },
    );
  }
}
