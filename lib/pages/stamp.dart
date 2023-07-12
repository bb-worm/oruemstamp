import 'package:flutter/material.dart';

import 'common/appbar.dart';

class StampPage extends StatefulWidget {
  @override
  _StampPageState createState() => _StampPageState();
}

class _StampPageState extends State<StampPage> {
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
              Icon(Icons.landscape, color: Colors.green, size: 40),
              Text("탬프",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))
            ],
          )),
      body: const Center(child: Text("stamp")),
    );
  }
}
