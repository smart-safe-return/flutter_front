// import 'package:flutter/material.dart';
// import 'package:flutter_naver_map/flutter_naver_map.dart';

// class NaverMapWidget extends StatelessWidget {
//   const NaverMapWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: NaverMap(
//       //   options: NaverMapViewOptions(
//       //     initialCameraPosition: NCameraPosition(
//       //       target: NLatLng(37.5665, 126.9780), // 서울 중심 좌표
//       //       zoom: 15,
//       //     ),
//         ),
//         onMapReady: (myMapController) {
//           debugPrint("네이버 맵 로딩됨!");
//         },
//         onMapTapped: (point, latLng) {
//           debugPrint("클릭한 위치: ${latLng.latitude}, ${latLng.longitude}");
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class NaverMapWidget extends StatelessWidget {
  const NaverMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '지도는 나중에 추가할 예정이에요!',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
