import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageInfo extends StatelessWidget {
  const MyPageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: const [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile.png'),
                backgroundColor: CupertinoColors.inactiveGray,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '라이언 님',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '안전 귀가 이용자',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home, size: 40, color: Colors.grey),
                onPressed: () {
                  print("집 아이콘 눌림!");
                },
              ),
              IconButton(
                icon: const Icon(Icons.star, size: 40, color: Colors.amber),
                onPressed: () {
                  print("별 아이콘 눌림!");
                },
              ),
              IconButton(
                icon: const Icon(Icons.warning_amber_rounded,
                    size: 40, color: Colors.redAccent),
                onPressed: () {
                  print("사이렌 아이콘 눌림!");
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
