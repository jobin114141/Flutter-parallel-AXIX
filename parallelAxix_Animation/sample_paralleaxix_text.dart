import 'package:flutter/material.dart';

class SampleParalleaxixText extends StatelessWidget {
  final double scrollOffset;

  const SampleParalleaxixText({Key? key, required this.scrollOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double startOffset = 100; // Start effect after 100px of scroll
    double endOffset = 400;   // Complete effect at 400px

    double progress = (scrollOffset - startOffset) / (endOffset - startOffset);
    progress = progress.clamp(0.0, 1.0); // Keep progress between 0 and 1

    double opacity = progress; // 0 (invisible) to 1 (fully visible)
    double scale = 0.7 + (progress * 0.3); // Scale from 0.7 to 1.0

    return Container(
      height: 300,
      alignment: Alignment.center,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: opacity,
        child: Transform.scale(
          scale: scale,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: "MADE TO \n"),
                    TextSpan(text: "MOVE MADE\n"),
                    TextSpan(text: "YOU _"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/featured1.png',
                width: 200,
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
