// ✅ myprofile.dart
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    const signatureColor = Color.fromARGB(255, 102, 247, 255);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: signatureColor,
        foregroundColor: Colors.black,
        title: const Text('내 정보 수정'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfileItem('아이디', '라이언', () {
              print("ID 수정");
            }),
            const Divider(),
            buildProfileItem('비밀번호', '********', () {
              print("비밀번호 수정");
            }),
            const Divider(),
            buildProfileItem('연락처', '010 - 0810 - 2135', () {
              print("연락처 수정");
            }),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  print("회원 탈퇴 버튼 눌림!");
                  // TODO: 탈퇴 로직 연결
                },
                child: const Text(
                  '회원 탈퇴',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildProfileItem(String title, String value, VoidCallback onEdit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text('$title: $value', style: const TextStyle(fontSize: 16)),
          ),
          ElevatedButton(
            onPressed: onEdit,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
            ),
            child: const Text('수정'),
          ),
        ],
      ),
    );
  }
}
