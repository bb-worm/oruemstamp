import 'package:flutter/material.dart';

import 'package:oruemstamp/pages/common/appbar.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          appBar: AppBar(),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "오름",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.location_pin, color: Colors.green, size: 40),
              Text("정보",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))
            ],
          )),
      body: const Center(
        child: Text("info"),
      ),
    );
  }
}
