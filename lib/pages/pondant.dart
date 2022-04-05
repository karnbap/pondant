import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pondant/pages/HomePage.dart';
import 'package:pondant/pages/qnaPage.dart';
import 'package:pondant/pages/tutorFeedPage.dart';

import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Pondant extends StatefulWidget {
  const Pondant({Key? key}) : super(key: key);

  @override
  State<Pondant> createState() => _PondantState();
}

class _PondantState extends State<Pondant> {
  final Color navigationBarColor = Colors.white;

  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    /// [AnnotatedRegion<SystemUiOverlayStyle>] only for android black navigation bar. 3 button navigation control (legacy)
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.home,
                size: 56,
                color: Colors.amber[400],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.favorite_rounded,
                size: 56,
                color: Colors.red[400],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.email_rounded,
                size: 56,
                color: Colors.green[400],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.person_pin,
                size: 56,
                color: Colors.blue[400],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: WaterDropNavBar(
            backgroundColor: navigationBarColor,
            onItemSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
            },
            selectedIndex: selectedIndex,
            barItems: <BarItem>[
              BarItem(
                filledIcon: Icons.home,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                  filledIcon: Icons.emoji_people,
                  outlinedIcon: Icons.emoji_people_outlined),
              BarItem(
                filledIcon: Icons.message,
                outlinedIcon: Icons.message_outlined,
              ),
              BarItem(
                filledIcon: Icons.person_pin,
                outlinedIcon: Icons.person_pin_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
