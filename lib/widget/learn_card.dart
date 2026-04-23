import 'package:flutter/material.dart';
import '../pages/learn_screen.dart';

class LearnCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String reward;

  const LearnCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.reward,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            // Image
            Image.asset(
              imagePath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, _, __) => Container(
                height: 80,
                color: Colors.grey.shade200,
                child: const Icon(Icons.book, size: 30),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.card_giftcard,
                        size: 10,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 2),
                      Flexible(
                        child: Text(
                          reward,
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Learn Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LearnScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 25,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDB0011),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "Learn",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
