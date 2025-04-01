// ✅ mysafeguard.dart
import 'package:flutter/material.dart';

class MySafeguard extends StatefulWidget {
  const MySafeguard({super.key});

  @override
  State<MySafeguard> createState() => _MySafeguardState();
}

class _MySafeguardState extends State<MySafeguard> {
  final List<Map<String, String>> guardians = [
    {'name': '파이리', 'phone': '010-0525-1234'},
    {'name': '꼬부기', 'phone': '010-0419-1234'},
    {'name': '이상해씨', 'phone': '010-0628-1234'},
    {'name': '피카츄', 'phone': '010-0426-1234'},
    {'name': '피존투', 'phone': '010-0330-1234'},
    {'name': '잠만보', 'phone': '010-1231-1234'},
  ];

  int? expandedIndex;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const signatureColor = Color.fromARGB(255, 102, 247, 255);

    return Scaffold(
      appBar: AppBar(
        title: const Text('긴급 연락처 설정'),
        backgroundColor: signatureColor,
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              '안전지킴이 등록',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(labelText: '이름'),
                        ),
                        TextField(
                          controller: phoneController,
                          decoration: const InputDecoration(labelText: '연락처'),
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  print(
                      "등록됨: \${nameController.text}, \${phoneController.text}");
                },
                child: const Text('등록'),
              ),
            ),
            const SizedBox(height: 48),
            const Text(
              '등록된 안전지킴이',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ...List.generate(guardians.length, (index) {
              final guardian = guardians[index];
              final isExpanded = expandedIndex == index;

              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        expandedIndex = isExpanded ? null : index;
                      });
                    },
                    child: Container(
                      height: 90,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8.0),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                guardian['name']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isExpanded
                        ? Padding(
                            padding: const EdgeInsets.only(
                                top: 12.0, left: 60.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  guardian['phone']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                TextButton(
                                  onPressed: () {
                                    print("수정 클릭: \${guardian['name']}");
                                  },
                                  child: const Text(
                                    '수정',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
