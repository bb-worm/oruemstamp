import 'package:flutter/material.dart';

import 'package:oruemstamp/pages/info.dart';
import 'package:oruemstamp/pages/stamp.dart';
import 'package:oruemstamp/pages/weather.dart';
import 'package:oruemstamp/providers/map.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    InfoPage(),
    WeatherPage(),
    StampPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          items: __bottomItems(),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ));
  }
}

class ChangeNotifierProvide {}

List<BottomNavigationBarItem> __bottomItems() {
  return [
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/bottomNavigator/location_pin_off.png',
          width: 35,
        ),
        activeIcon: Image.asset(
          'assets/bottomNavigator/location_pin_on.png',
          width: 35,
        ),
        label: "오름 정보"),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/bottomNavigator/sunny_off.png',
          width: 40,
        ),
        activeIcon: Image.asset(
          'assets/bottomNavigator/sunny_on.png',
          width: 40,
        ),
        label: "제주 날씨"),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/bottomNavigator/stamp_off.png',
          width: 35,
        ),
        activeIcon: Image.asset(
          'assets/bottomNavigator/stamp_on.png',
          width: 35,
        ),
        label: "스탬프"),
  ];
}
