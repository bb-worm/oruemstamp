import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class MapModel with ChangeNotifier {
  KakaoMapController? mapController;

  void setController(KakaoMapController controller) {
    mapController = controller;
    notifyListeners();
  }

  void updateCenter(LatLng latLng) {
    mapController?.panTo(latLng);
    notifyListeners();
  }
}
