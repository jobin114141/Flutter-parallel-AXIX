import 'package:flutter/material.dart';

class ParallaxImageScroll extends StatelessWidget {
  final double scrollOffset;

  const ParallaxImageScroll({Key? key, required this.scrollOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double startOffset = 100; // Start moving after 100 pixels of scroll
    double endOffset = 400;   // Stop moving at 400 pixels

    double progress = (scrollOffset - startOffset) / (endOffset - startOffset);
    progress = progress.clamp(0.0, 1.0); // Keep value between 0 and 1

    double imageAlignment = -1.0 + (progress * 1.0); // Moves from -1.0 (left) to 0.0 (center)

  //  double imageAlignment = 1.0 - (progress * 1.0); // Moves from 1.0 (right) to 0.0 (center)
    return Container(

      alignment: Alignment.center,
      child: AnimatedAlign(
        duration: Duration(milliseconds: 100),
        alignment: Alignment(imageAlignment, 0.0),
        child: Image.asset(
          'assets/images/home_scrren_pic1.png',
          width: 200,
          height: 150,
        ),
      ),
    );
  }
}
