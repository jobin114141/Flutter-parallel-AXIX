import 'package:flutter/material.dart';
import 'package:tanzero/common_widgets/gradent_color_background.dart';
import 'package:tanzero/homeScreen/home_screen_widgets/catagories_widget.dart';
import 'package:tanzero/homeScreen/home_screen_widgets/drower_namaste_widget.dart';
import 'package:tanzero/homeScreen/home_screen_widgets/featured_widget.dart';
import 'package:tanzero/homeScreen/home_screen_widgets/search_widget.dart';
import 'package:tanzero/sample_paralleaxix_left.dart';
import 'package:tanzero/sample_paralleaxix_right.dart';
import 'package:tanzero/sample_paralleaxix_text.dart';

class YourActivity extends StatefulWidget {
  const YourActivity({super.key});

  @override
  State<YourActivity> createState() => _YourActivityState();
}

class _YourActivityState extends State<YourActivity> {
  final ScrollController _scrollController = ScrollController();
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          GradentColorBackground(),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                  child: Column(
                    children: [
                      DrowerNamasteWidget(),
                      SizedBox(height: 18),
                      SearchWidget(),
                      SizedBox(height: 18),
                      CatagoriesWidget(),
                      SizedBox(height: 18),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ParallaxImageScroll(scrollOffset: scrollOffset),
                ),
                SizedBox(
                  height: 300,
                  child: SampleParalleaxixText(scrollOffset: scrollOffset),
                ),
                SizedBox(
                  height: 200,
                  child: SampleParalleaxixRight(scrollOffset: scrollOffset),
                ),
                FeaturedWidget(),
                DrowerNamasteWidget(),
                SearchWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
