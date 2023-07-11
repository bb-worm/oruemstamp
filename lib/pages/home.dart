import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("오름스탬프"),
          backgroundColor: Colors.green,
        ),
        body: Center(
            child: TextButton(
          child: const Text("click"),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        )));
  }
}
