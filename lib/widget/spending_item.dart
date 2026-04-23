import 'package:flutter/material.dart';

class SpendingItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String time;
  final String amount;

  const SpendingItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.time,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            height: 48,
            width: 48,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.fastfood, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        Text(
          amount,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFDB0011),
          ),
        ),
      ],
    );
  }
}
