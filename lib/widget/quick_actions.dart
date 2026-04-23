import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      {"icon": Icons.swap_horiz_rounded, "label": "Transfer"},
      {"icon": Icons.qr_code_scanner_rounded, "label": "Scan"},
      {"icon": Icons.receipt_long_rounded, "label": "Bill"},
      {"icon": Icons.grid_view_rounded, "label": "More"},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: actions.map((action) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  action["icon"] as IconData,
                  color: const Color(0xFFDB0011),
                  size: 24,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                action["label"] as String,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
