import 'package:flutter/material.dart';
import 'package:smart_safe_return/components/settings/user.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40), // 상단 여백

            // 아이디 입력 + 중복확인
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: idController,
                    decoration: const InputDecoration(
                      labelText: '아이디',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    print('아이디 중복확인: ${idController.text}');
                  },
                  child: const Text('중복확인'),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // 연락처 입력 + 중복확인 (비밀번호보다 위로 이동됨)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: '연락처',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    print('연락처 중복확인: ${phoneController.text}');
                  },
                  child: const Text('중복확인'),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // 비밀번호 입력
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),

            // 등록 버튼
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  String id = idController.text;
                  String pw = passwordController.text;
                  String phone = phoneController.text;

                  // 회원가입 완료 후 로그인 화면으로 이동
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const UserPage()),
                  );
                },
                child: const Text(
                  '등록',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
