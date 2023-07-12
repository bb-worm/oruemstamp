import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:oruemstamp/pages/info.dart';
import 'package:oruemstamp/pages/stamp.dart';
import 'package:oruemstamp/pages/weather.dart';

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
        body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "오름정보"),
            BottomNavigationBarItem(icon: Icon(Icons.sunny), label: "날씨정보"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.mapPin), label: "스탬프")
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ));
  }
}
