import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:oruemstamp/pages/common/appbar.dart';
import 'package:oruemstamp/pages/map.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        image: 'assets/appbar/info.png',
      ),
      body: SlidingUpPanel(
        collapsed: CollapsedPanel(radius: radius),
        borderRadius: radius,
        panel: Panel(),
        body: OruemMap(),
        minHeight: 190,
        maxHeight: 500,
      ),
    );
  }
}

class CollapsedPanel extends StatelessWidget {
  const CollapsedPanel({super.key, required this.radius});
  final BorderRadiusGeometry radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: radius),
        child: Container(
            margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
            alignment: Alignment.topCenter,
            child: const Column(
              children: [
                OruemSearchBar(),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LocationButton(text: "제주시"),
                    LocationButton(text: "서귀포시"),
                    LocationButton(text: "서부"),
                    LocationButton(text: "동부"),
                  ],
                ),
              ],
            )));
  }
}

class Panel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}

class OruemSearchBar extends StatelessWidget {
  const OruemSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchBar(
        constraints: BoxConstraints(maxHeight: 100),
        side: MaterialStatePropertyAll(BorderSide(color: Colors.grey)),
        leading: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.grey)),
        hintText: "궁금한 오름을 검색해 보세요.",
        elevation: MaterialStatePropertyAll(4.0),
        shape: MaterialStatePropertyAll(StadiumBorder()));
  }
}

class LocationButton extends StatelessWidget {
  const LocationButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          elevation: 4.0,
          foregroundColor: Colors.grey,
          backgroundColor: Colors.white,
        ),
        child: Text(text));
  }
}
