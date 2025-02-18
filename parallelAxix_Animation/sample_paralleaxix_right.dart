import 'package:flutter/material.dart';

class SampleParalleaxixRight extends StatelessWidget {
  final double scrollOffset;

  const SampleParalleaxixRight({Key? key, required this.scrollOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double startOffset = 100; // Start moving and fading after 100px of scroll
    double endOffset = 400;   // Complete effect at 400px

    double progress = (scrollOffset - startOffset) / (endOffset - startOffset);
    progress = progress.clamp(0.0, 1.0); // Ensure progress stays between 0 and 1

    double imageAlignment = 1.0 - (progress * 1.0); // Moves from right (1.0) to center (0.0)
    double opacity = 0.1 + (progress * 0.7); // Starts at 0.3 and fades to 1.0

    return Container(
      height: 200,
      alignment: Alignment.center,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: opacity,
        child: AnimatedAlign(
          duration: Duration(milliseconds: 200),
          alignment: Alignment(imageAlignment, 0.0),
          child: Image.asset(
            'assets/images/home_scrren_pic1.png',
            width: 200,
            height: 150,
          ),
        ),
      ),
    );
  }
}
