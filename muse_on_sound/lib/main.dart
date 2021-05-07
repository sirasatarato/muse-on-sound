import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/pages/page_frame.dart';
import 'src/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muse on Sound',
      theme: ThemeData(
        accentColor: Color(0xFFDD0870)
      ),
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 0)),
        builder: (context, AsyncSnapshot snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? SplashPage()
                : PageFrame(),
      ),
    );
  }
}
