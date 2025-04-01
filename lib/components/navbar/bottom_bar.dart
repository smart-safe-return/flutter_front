import 'package:flutter/material.dart';
import 'package:smart_safe_return/components/home/naver_map.dart';
import 'package:smart_safe_return/components/setting/mypage.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                const NaverMapWidget(),
                const MyPage(), // ← 여기서 'setting' 대신 마이페이지 넣기
              ],
            ),
          ),
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
        ],
      ),
    );
  }
}
