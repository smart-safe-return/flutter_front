import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inquiry extends StatefulWidget {
  const Inquiry({super.key});

  @override
  State<Inquiry> createState() => _InquiryState();
}

class _InquiryState extends State<Inquiry> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  final List<String> claimTypes = ['기타', '유형1', '유형2', '유형3', '유형4'];
  String selectedClaim = '기타';
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    const signatureColor = Color.fromARGB(255, 102, 247, 255);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
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
                    '문의하기',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: '제목',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ✅ 커스텀 드롭다운
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '클레임 유형',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(selectedClaim),
                                    Icon(isExpanded
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),

                            // ✅ 항목이 박스로 감싸지는 부분
                            if (isExpanded)
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: claimTypes.map((type) {
                                    return ListTile(
                                      title: Text(type),
                                      onTap: () {
                                        setState(() {
                                          selectedClaim = type;
                                          isExpanded = false;
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      SizedBox(
                        height: 180,
                        child: TextField(
                          controller: contentController,
                          maxLines: null,
                          expands: true,
                          decoration: const InputDecoration(
                            labelText: '문의 내용',
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            print('제목: ${titleController.text}');
                            print('클레임 유형: $selectedClaim');
                            print('내용: ${contentController.text}');
                            // TODO: 서버로 전송하는 로직 구현
                          },
                          child: const Text('문의 내용 등록'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
