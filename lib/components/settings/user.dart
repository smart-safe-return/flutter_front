import 'package:flutter/material.dart';
import 'package:smart_safe_return/components/navbar/bottom_bar.dart';
import 'package:smart_safe_return/components/settings/siginup.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();
    final pwController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: '아이디',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: pwController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                print('로그인 시도: ${idController.text}, ${pwController.text}');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Bottom()),
                );
              },
              child: const Text('로그인'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    print('아이디 찾기');
                  },
                  child: const Text('아이디 찾기'),
                ),
                TextButton(
                  onPressed: () {
                    print('비밀번호 찾기');
                  },
                  child: const Text('비밀번호 찾기'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: const Text('회원가입'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
