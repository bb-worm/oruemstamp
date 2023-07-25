import 'package:flutter/material.dart';
import 'package:oruemstamp/providers/oruem_tile.dart';
import 'package:provider/provider.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:oruemstamp/pages/common/appbar.dart';
import 'package:oruemstamp/pages/map.dart';

PanelController panelController = PanelController();

BorderRadiusGeometry radius = const BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);

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
        image: 'assets/appbar/info.png',
      ),
      body: SlidingUpPanel(
        controller: panelController,
        collapsed: CollapsedPanel(),
        borderRadius: radius,
        panel: Panel(),
        body: OruemMap(),
        minHeight: 190,
        maxHeight: 500,
        onPanelOpened: () {
          if (context.read<OruemTileModel>().tiles.isEmpty) {
            context.read<OruemTileModel>().setAllTiles();
          }
        },
      ),
    );
  }
}

class CollapsedPanel extends StatelessWidget {
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
                    LocationButton(
                      text: "전체",
                      location: "all",
                    ),
                    LocationButton(
                      text: "제주시",
                      location: "north",
                    ),
                    LocationButton(
                      text: "서귀포시",
                      location: "south",
                    ),
                    LocationButton(
                      text: "서부",
                      location: "west",
                    ),
                    LocationButton(
                      text: "동부",
                      location: "east",
                    ),
                  ],
                ),
              ],
            )));
  }
}

class Panel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: radius),
        child: Container(
            margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                OruemSearchBar(),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LocationButton(
                      text: "전체",
                      location: "all",
                    ),
                    LocationButton(
                      text: "제주시",
                      location: "north",
                    ),
                    LocationButton(text: "서귀포시", location: "south"),
                    LocationButton(
                      text: "서부",
                      location: "west",
                    ),
                    LocationButton(
                      text: "동부",
                      location: "east",
                    ),
                  ],
                ),
                PanelBody()
              ],
            )));
  }
}

class PanelBody extends StatefulWidget {
  @override
  State<PanelBody> createState() => _PanelBodyState();
}

class _PanelBodyState extends State<PanelBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: context.watch<OruemTileModel>().tiles,
      ),
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
  const LocationButton({super.key, required this.text, required this.location});
  final String text;
  final String location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: OutlinedButton(
          onPressed: () {
            panelController.open();
            context.read<OruemTileModel>().setTiles(location);
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.only(left: 5, right: 5),
            side: const BorderSide(color: Colors.grey),
            elevation: 4.0,
            foregroundColor: Colors.grey,
            backgroundColor: Colors.white,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 12),
          )),
    );
  }
}
