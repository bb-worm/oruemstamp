import 'package:flutter/material.dart';

import 'common/appbar.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        image: 'assets/appbar/weather.png',
      ),
      body: const Center(child: Text("weather")),
    );
  }
}
