import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
  final Size media;
  final Widget child;
  const CustomPadding({super.key, required this.media, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: media.width * .06),
      child: child,
    );
  }
}
