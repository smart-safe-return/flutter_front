import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'mysafeguard_post.dart';
import 'mysafeguard_list.dart';

class MySafeguard extends StatefulWidget {
  const MySafeguard({super.key});

  @override
  State<MySafeguard> createState() => _MySafeguardState();
}

class _MySafeguardState extends State<MySafeguard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, String>> guardians = [
    {'name': '파이리', 'phone': '010-0525-1234'},
    {'name': '꼬부기', 'phone': '010-0419-1234'},
    {'name': '이상해씨', 'phone': '010-0628-1234'},
    {'name': '피카츄', 'phone': '010-0426-1234'},
    {'name': '피존투', 'phone': '010-0330-1234'},
    {'name': '잠만보', 'phone': '010-1231-1234'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // 상태바 스타일 조정 (밝은 배경 + 어두운 아이콘)
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  }

  void addGuardian(String name, String phone) {
    setState(() {
      guardians.add({'name': name, 'phone': phone});
    });
  }

  @override
  Widget build(BuildContext context) {
    const signatureColor = Color.fromARGB(255, 102, 247, 255);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ 커스텀 상단바
            Container(
              color: signatureColor,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    '긴급 연락처 설정',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48), // 아이콘 공간 확보용
                ],
              ),
            ),

            // ✅ 탭바
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(
                  color: Color.fromARGB(255, 159, 208, 214),
                ),
                tabs: const [
                  Tab(text: '등록'),
                  Tab(text: '목록'),
                ],
              ),
            ),

            // ✅ 탭 뷰
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  MySafeguardPost(onAddGuardian: addGuardian),
                  MySafeguardList(guardians: guardians),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
