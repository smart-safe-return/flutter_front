import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaviMap extends StatelessWidget {
  const NaviMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('도보 길안내'),
      ),
      body: Column(
        children: [
          Expanded(
            child: NaverMap(
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: NLatLng(37.5665, 126.9780), // 서울 중심 좌표로 초기화
                  zoom: 14,
                ),
              ),
              onMapReady: (myMapController) {
                debugPrint("네이버 맵 로딩됨!");
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // 경로 계산 및 안내 시작 로직을 이곳에 추가
              debugPrint("도보 길안내 시작!");
            },
            child: const Text('도보 길안내 시작'),
          ),
        ],
      ),
    );
  }
}
