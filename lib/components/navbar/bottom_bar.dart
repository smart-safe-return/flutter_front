import 'package:flutter/material.dart';
import 'package:smart_safe_return/components/home/naver_map.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    return DefaultTabController(
      length: 2, // 탭 개수 (HOME, SETTING)
      child: Column(
        children: [
          // TabBarView를 위한 공간 확보
          const Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(), // 스와이프 비활성화
              children: <Widget>[
                Center(
                  child: NaverMapWidget(),
                ),
                Center(
                  child: Text('setting'),
                ),
              ],
            ),
          ),
          // Bottom Navigation Bar
          Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            height: screenHeight * 0.1,
            child: const TabBar(
              labelColor: Color.fromARGB(255, 102, 247, 255),
              indicatorColor: Colors.transparent,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home, size: 30),
                  child: Text('HOME', style: TextStyle(fontSize: 9)),
                ),
                Tab(
                  icon: Icon(Icons.settings, size: 30),
                  child: Text('SETTING', style: TextStyle(fontSize: 9)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
