import 'package:flutter/material.dart';
import 'package:oruemstamp/logics/oruem.dart';

class OruemTileModel with ChangeNotifier {
  List<ListTile> tiles = [];

  void _setTiles(List<Oruem> locations) {
    tiles = [];

    for (var l in locations) {
      tiles.add(ListTile(
          leading: const Icon(
            Icons.landscape,
            color: Colors.green,
          ),
          title: Text("${l.name}\n${l.addressJibun}"),
          onTap: () {}));
    }
  }

  Future<void> setAllTiles() async {
    final locations = await OruemApi().getAllLocations();
    _setTiles(locations);
    notifyListeners();
  }

  // key = all | north | south | west | east
  Future<void> setTiles(String key) async {
    if (key == "all") {
      setAllTiles();
      return;
    }

    final locations = await OruemApi().getLocaitons(key);
    _setTiles(locations);
    notifyListeners();
  }
}
