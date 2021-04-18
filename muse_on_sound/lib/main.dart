import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/pages/page_frame.dart';
import 'src/pages/splash_page.dart';
import 'src/util/theme_data/bottom_navigation_bar_theme_data.dart';
import 'src/util/theme_data/text_theme_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, AsyncSnapshot snapshot) => buildMaterialApp(snapshot),
    );
  }

  GetMaterialApp buildMaterialApp(AsyncSnapshot snapshot) {
    return GetMaterialApp(
      title: 'Muse on Sound',
      theme: ThemeData(
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
        textTheme: textThemeData,
      ),
      debugShowCheckedModeBanner: false,
      home: snapshot.connectionState == ConnectionState.waiting
          ? SplashPage()
          : PageFrame(),
    );
  }
}
