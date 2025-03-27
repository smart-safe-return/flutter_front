import 'package:flutter/material.dart';
import 'package:smart_safe_return/components/setting/mypage.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    return DefaultTabController(
      length: 2, // 탭 개수 (HOME, SETTING)
      child: Scaffold(
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(), // 스와이프 비활성화
          children: <Widget>[
            Center(
              child: Text('home'), // 나중에 HomePage()로 교체 가능
            ),
            MyPage(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: SizedBox(
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
