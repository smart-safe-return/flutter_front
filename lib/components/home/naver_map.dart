import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapWidget extends StatelessWidget {
  const NaverMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NaverMap(
      options: NaverMapViewOptions(
        initialCameraPosition: NCameraPosition(
          target: NLatLng(37.5665, 126.9780), // 서울 중심 좌표
          zoom: 10,
          bearing: 0,
          tilt: 0,
        ),
        mapType: NMapType.basic,
        activeLayerGroups: [NLayerGroup.building, NLayerGroup.transit],
      ),
      onMapReady: (myMapController) {
        debugPrint("네이버 맵 로딩됨!");
      },
      onMapTapped: (point, latLng) {
        debugPrint("${latLng.latitude}、${latLng.longitude}");
      },
    );
  }
}
