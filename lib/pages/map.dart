import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:oruemstamp/logics/oruem.dart';

import '../providers/map.dart';

class OruemMap extends StatefulWidget {
  @override
  _OruemMapState createState() => _OruemMapState();
}

class _OruemMapState extends State<OruemMap> {
  Set<Marker> markers = {};

  @override
  KakaoMap build(BuildContext context) {
    return KakaoMap(
      currentLevel: 11,
      zoomControl: true,
      markers: markers.toList(),
      onMapCreated: ((controller) async {
        // set map controller
        context.read<MapModel>().setController(controller);

        final locations = await OruemApi().getAllLocations();
        for (var l in locations) {
          markers.add(Marker(
            markerId: markers.length.toString(),
            latLng: LatLng(l.latitude, l.longitude),
            width: 7,
            height: 10,
            markerImageSrc:
                'https://w7.pngwing.com/pngs/96/889/png-transparent-marker-map-interesting-places-the-location-on-the-map-the-location-of-the-thumbnail.png',
          ));
        }

        // set center
        controller.setCenter(LatLng(33.450701 - 0.45, 126.570667));

        print(await controller.getCenter());

        setState(() {});
      }),
    );
  }
}
