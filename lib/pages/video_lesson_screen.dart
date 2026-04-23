import 'package:flutter/material.dart';

class VideoLessonScreen extends StatelessWidget {
  final String title;
  final String videoUrl;

  const VideoLessonScreen({
    super.key,
    required this.title,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFFDB0011),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.play_circle_filled,
              size: 80,
              color: Color(0xFFDB0011),
            ),
            const SizedBox(height: 20),
            const Text("Video player coming soon!"),
            const SizedBox(height: 10),
            Text(
              "Lesson: $title",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
