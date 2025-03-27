import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  Future<LocationData> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // 위치 서비스가 활성화되어 있는지 확인
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        throw Exception("위치 서비스를 활성화해주세요.");
      }
    }

    // 위치 권한 확인
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception("위치 권한을 허용해주세요.");
      }
    }

    // 위치 정보 가져오기
    try {
      final locationData = await _location.getLocation();
      print("현재 위치: ${locationData.latitude}, ${locationData.longitude}");
      return locationData;
    } catch (e) {
      print("위치 정보 가져오기 실패: $e");
      throw Exception("위치 정보 가져오기 실패: $e");
    }
  }
}
