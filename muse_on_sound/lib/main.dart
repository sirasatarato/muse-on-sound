import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muse_on_sound/src/pages/page_frame.dart';
import 'package:muse_on_sound/src/util/mos_binding.dart';

import 'src/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MosBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Muse on Sound',
      theme: ThemeData(accentColor: Color(0xFFDD0870)),
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 0)),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return PageFrame();
          }

          return SplashPage();
        },
      ),
    );
  }
}
