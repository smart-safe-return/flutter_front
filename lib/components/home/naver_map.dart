import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'package:smart_safe_return/services/location_service.dart';
import 'package:smart_safe_return/services/permission_service.dart';

class NaverMapWidget extends StatefulWidget {
  const NaverMapWidget({super.key});

  @override
  _NaverMapWidgetState createState() => _NaverMapWidgetState();
}

class _NaverMapWidgetState extends State<NaverMapWidget> {
  NaverMapController? _mapController;
  NLatLng? _currentLocation; // 현재 위치는 null로 초기화

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // 현재 위치 가져오기
  Future<void> _getCurrentLocation() async {
    // 위치 권한 요청
    bool hasPermission = await PermissionService.requestLocationPermission();
    if (!hasPermission) {
      debugPrint("위치 권한이 거부되었습니다.");
      return;
    }

    // 현재 위치 가져오기
    LocationData? locationData = await LocationService.getCurrentLocation();
    if (locationData == null) {
      debugPrint("위치 데이터를 가져오지 못했습니다.");
      return;
    }

    debugPrint("현재 위치: ${locationData.latitude}, ${locationData.longitude}");

    setState(() {
      // 위치 정보를 _currentLocation에 할당
      _currentLocation =
          NLatLng(locationData.latitude!, locationData.longitude!);
    });

    // 맵 컨트롤러가 준비되었으면 카메라 이동
    if (_mapController != null && _currentLocation != null) {
      _mapController!.updateCamera(
        NCameraUpdate.withParams(
          target: _currentLocation!,
          zoom: 15,
        ),
      );
      debugPrint("카메라를 현재 위치로 이동했습니다: $_currentLocation");
    } else {
      debugPrint("맵 컨트롤러가 아직 준비되지 않았거나, 위치가 아직 설정되지 않았습니다.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: '검색...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              // 검색어에 따른 처리 로직 추가
            },
          ),
        ),
      ),
      body: NaverMap(
        options: NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(
            target: _currentLocation ??
                NLatLng(37.5665, 126.9780), // 기본 위치를 null로 설정하고 위치가 있을 때만 갱신
            zoom: 15,
          ),
        ),
        onMapReady: (mapController) async {
          _mapController = mapController;
          debugPrint("네이버 맵 로딩 완료!");

          // 맵이 준비된 후 현재 위치로 이동
          await _getCurrentLocation(); // 맵 로드 후 다시 위치 업데이트
        },
        onMapTapped: (point, latLng) {
          debugPrint("클릭한 위치: ${latLng.latitude}, ${latLng.longitude}");
        },
      ),
    );
  }
}
