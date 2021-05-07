import 'package:flutter/material.dart';

class GradientWrapper extends StatelessWidget {
  final Widget? child;

  const GradientWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff123456),
            const Color(0xff6A268D),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.clamp,
        ),
      ),
      child: child,
    );
  }
}
