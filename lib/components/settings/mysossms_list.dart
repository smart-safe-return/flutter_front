import 'package:flutter/material.dart';

class MySosSmsList extends StatefulWidget {
  final List<String> savedTitles;

  const MySosSmsList({super.key, required this.savedTitles});

  @override
  State<MySosSmsList> createState() => _MySosSmsListState();
}

class _MySosSmsListState extends State<MySosSmsList> {
  int? expandedIndex;

  final Map<String, String> details = {
    '안전 귀가길 SOS': '상세내용1',
    '안전 출근길 SOS': '상세내용2',
    '안전 퇴근길 SOS': '상세내용3',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: widget.savedTitles.length,
        itemBuilder: (context, index) {
          final title = widget.savedTitles[index];
          final isExpanded = expandedIndex == index;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                trailing: TextButton(
                  onPressed: () {
                    print('선택됨: \$title');
                    // TODO: 선택 처리 로직 구현
                  },
                  child: const Text('선택'),
                ),
                onTap: () {
                  setState(() {
                    expandedIndex = isExpanded ? null : index;
                  });
                },
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isExpanded
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                details[title] ?? '상세 내용 없음',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black87),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                print('수정 클릭: \$title');
                                // TODO: 수정 기능 연동
                              },
                              child: const Text(
                                '수정',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
