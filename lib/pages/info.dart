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
        title: "오름스탬프",
      ),
      body: Center(
        child: Text("info"),
      ),
    );
  }
}
