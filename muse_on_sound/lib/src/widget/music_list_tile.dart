import 'package:flutter/material.dart';

class MusicListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        color: Colors.white,
      ),
      title: Text('This is Song name', style: TextStyle(color: Colors.white)),
      subtitle: Text('This is Artist name', style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.more_vert_rounded, color: Colors.white),
    );
  }
}
