import 'package:flutter/material.dart';
import 'package:muse_on_sound/src/widget/gradient_wrapper.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GradientWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildLogo(),
            buildTitle(),
            buildSubTitle(),
            SizedBox(),
          ],
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 255.0,
          ),
        ],
      ),
      child: Image.asset(
        'images/launcher_circle_icon.png',
        width: 210,
        height: 210,
      ),
    );
  }

  Text buildTitle() {
    return Text(
      'Muse On Sound',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontFamily: "PlayballRegular",
        fontSize: 44,
      ),
    );
  }

  RichText buildSubTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'A better Way\n',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        children: [
          TextSpan(
            text: 'To listen the world',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
  }
}
