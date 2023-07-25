import 'dart:convert';

import 'package:flutter/services.dart';

class Oruem {
  String name;
  double latitude;
  double longitude;
  String addressJibun;

  Oruem(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.addressJibun}) {
    name = name;
    latitude = latitude;
    longitude = longitude;
    addressJibun = addressJibun;
  }
}

class OruemApi {
  Future<List<Oruem>> getAllLocations() async {
    List<Oruem> ret = [];

    String jsonString =
        await rootBundle.loadString('assets/data/oruem_all.json');
    final jsonData = json.decode(jsonString);

    for (var d in jsonData) {
      ret.add(Oruem(
          name: d['placeName'],
          latitude: d['latitude'],
          longitude: d['longitude'],
          addressJibun: d['addressJibun']));
    }

    return ret;
  }

  Future<List<Oruem>> getLocaitons(String key) async {
    List<Oruem> ret = [];

    String jsonString = await rootBundle.loadString('assets/data/oruem.json');
    final jsonData = json.decode(jsonString);

    for (var d in jsonData[key]) {
      ret.add(Oruem(
          name: d['placeName'],
          latitude: d['latitude'],
          longitude: d['longitude'],
          addressJibun: d['addressJibun']));
    }

    return ret;
  }
}
