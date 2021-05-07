import 'package:flutter/material.dart';

class PlayListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '재생목록',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(width: 8),
                Text(
                  '4',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Spacer(),
                Icon(Icons.add, size: 28, color: Colors.white),
                SizedBox(width: 8),
                Icon(Icons.more_vert_rounded, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
