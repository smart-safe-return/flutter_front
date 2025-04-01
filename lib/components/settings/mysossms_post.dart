import 'package:flutter/material.dart';

class MySosSmsPost extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController messageController;
  final VoidCallback onSave;

  const MySosSmsPost({
    super.key,
    required this.titleController,
    required this.messageController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: '제목',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: TextField(
              controller: messageController,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
                labelText: 'SOS 메시지 내용',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSave,
              child: const Text('메시지 저장'),
            ),
          ),
        ],
      ),
    );
  }
}
