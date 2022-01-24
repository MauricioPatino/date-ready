
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ready_to_date/ui/pages/utils/global_routes.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:ready_to_date/ui/pages/models/model.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:ready_to_date/ui/pages/models/card_view.dart';

import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:ready_to_date/ui/pages/feedback.dart';
import 'package:ready_to_date/ui/pages/explore.dart';
import 'package:ready_to_date/ui/pages/settings.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

    class _HomePageState extends State<home> {
      int _selectedIndex = 1;

      late PageController _pageController;

      @override
      void initState(){
        super.initState();
        _pageController = PageController(initialPage: 1);
      }

      @override
      void dispose(){
        super.dispose();
        _pageController.dispose();
      }

      void onPageChanged(int index) {
        setState(() {
          _selectedIndex = index;
        });
      }

      void _onItemTapped(int index) {
        _pageController.jumpToPage(index);
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: homeScreenItems,

      ) ,

      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 30),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Feedback'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
