import 'package:flutter/material.dart';
import 'spending_item.dart';

class SpendingSection extends StatefulWidget {
  const SpendingSection({super.key});

  @override
  State<SpendingSection> createState() => _SpendingSectionState();
}

class _SpendingSectionState extends State<SpendingSection> {
  bool _isTracking = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Spending",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "USD 5",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/images/spending.png",
                height: 40,
                errorBuilder: (_, _, _) => const Icon(
                  Icons.shopping_bag_outlined,
                  size: 40,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => _isTracking = true),
                child: Text(
                  "Tracking",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _isTracking ? const Color(0xFFDB0011) : Colors.grey,
                    decoration: _isTracking
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationColor: const Color(0xFFDB0011),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => setState(() => _isTracking = false),
                child: Text(
                  "Chart",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: !_isTracking ? const Color(0xFFDB0011) : Colors.grey,
                    decoration: !_isTracking
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationColor: const Color(0xFFDB0011),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_isTracking)
            Column(
              children: const [
                SpendingItem(
                  imagePath: "assets/images/chips.png",
                  title: "Snack",
                  time: "1 hour ago",
                  amount: "-\$2",
                ),
                SizedBox(height: 8),
                SpendingItem(
                  imagePath: "assets/images/coffee.png",
                  title: "Drink",
                  time: "6 hours ago",
                  amount: "-\$3",
                ),
              ],
            )
          else
            Container(
              height: 100,
              alignment: Alignment.center,
              child: const Text(
                "Chart coming soon",
                style: TextStyle(color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }
}
