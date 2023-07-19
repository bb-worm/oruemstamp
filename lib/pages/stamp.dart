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
        image: 'assets/appbar/stamp.png',
      ),
      body: const Center(child: Text("stamp")),
    );
  }
}
