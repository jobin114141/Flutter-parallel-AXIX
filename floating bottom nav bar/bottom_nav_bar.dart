import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:tanzero/account_page.dart';
import 'package:tanzero/colors_const.dart';
import 'package:tanzero/homeScreen/home_page.dart';
import 'package:tanzero/search.dart';
import 'package:tanzero/your_activity.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  static const List<Widget> _widgetOptions = [
    HomePage(),
    Search(),
    YourActivity(),
    AccountPage()
  ];

  final List<Color> colors = [
    Colors.blue, // Home
    Colors.green, // Search
    Colors.orange, // Activity
    Colors.red, // Account
  ];

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    tabController = TabController(length: _widgetOptions.length, vsync: this);
    tabController.animation!.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted) {
        changePage(value);
      }
    });
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding:  EdgeInsets.only(bottom: 15),
              child: BottomBar(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    splashFactory: NoSplash.splashFactory, // Removes tap effect
                    highlightColor: Colors.transparent, // Removes highlight effect
                  ),
                  child: TabBar(
                    dividerColor: const Color.fromARGB(0, 46, 46, 46),
                    controller: tabController,
                    indicatorPadding: EdgeInsets.zero,
                    indicator: const BoxDecoration(), // Removes default underline
                    tabs: [
                      tabIcon(Icons.home, 0),
                      tabIcon(Icons.shopping_cart, 1),
                      tabIcon(Icons.favorite, 2),
                      tabIcon(Icons.person, 3),
                    ],
                  ),
                ),
                fit: StackFit.expand,
                icon: (width, height) => Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: null,
                    icon: Icon(Icons.arrow_upward_rounded,
                        color: Colors.grey, size: width),
                  ),
                ),
                borderRadius: BorderRadius.circular(500),
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
                showIcon: true,
                width: MediaQuery.of(context).size.width * 0.8,
                barColor:bottomnavbarBG,
                start: 2,
                end: 0,
                offset: 10,
                barAlignment: Alignment.bottomCenter,
                iconHeight: 25,
                iconWidth: 25,
                reverse: false,
                hideOnScroll: true,
                scrollOpposite: false,
                onBottomBarHidden: () {
                   
                },
                onBottomBarShown: () {},
                body: (context, controller) => TabBarView(
                  controller: tabController,
                  dragStartBehavior: DragStartBehavior.down,
                  physics: const BouncingScrollPhysics(),
                  children: _widgetOptions,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabIcon(IconData icon, int index) {
    bool isSelected = currentPage == index;

    return SizedBox(
      height: 60,
      width: 60,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? bottomnavbarselectedClr
                : Color.fromARGB(255, 26, 26, 25), // Circle background
          ),
          child: Column(
            children: [
              SizedBox(height: 4,),
              Icon(
                icon,
                color: isSelected
                    ? Colors.black
                    : Colors.grey, // Black when selected, grey otherwise
                size: 28,
              ),
              isSelected
                  ? Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ))
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
