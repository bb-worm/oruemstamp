import 'dart:convert';

import 'package:flutter/services.dart';

class Oruem {
  String name;
  double latitude;
  double longitude;

  Oruem({required this.name, required this.latitude, required this.longitude}) {
    name = name;
    latitude = latitude;
    longitude = longitude;
  }
}

class OruemApi {
  Future<List<Oruem>> getAllLocations() async {
    List<Oruem> ret = [];

    String jsonString = await rootBundle.loadString('assets/data/oruem.json');
    final jsonData = json.decode(jsonString);

    for (var d in jsonData) {
      ret.add(Oruem(
          name: d['placeName'],
          latitude: d['latitude'],
          longitude: d['longitude']));
    }

    return ret;
  }
}
