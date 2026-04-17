import 'package:flutter/material.dart';

class GuessScreen extends StatefulWidget {
  const GuessScreen({super.key});

  @override
  State<GuessScreen> createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  int? _selectedIndex; // tracks which card is selected, null = none selected

  final List<Map<String, String>> _options = [
    {
      "label": "Children (5-11 years old)",
      "imagePath": "assets/images/children.png",
    },
    {
      "label": "Youths (12-17 years old)",
      "imagePath": "assets/images/youths.png",
    },
    {"label": "Parents", "imagePath": "assets/images/parents.png"},
  ];

  void _onSelect(int index) {
    setState(() => _selectedIndex = index);
  }

  void _onContinue() {
    if (_selectedIndex == null) return; // do nothing if nothing selected

    // We'll add navigation to each user type's home screen later
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Selected: ${_options[_selectedIndex!]["label"]}"),
        backgroundColor: const Color(0xFFDB0011),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // ❓ Title
              const Text(
                "You are?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 32),

              // 🃏 Selection Cards
              Expanded(
                child: ListView.separated(
                  itemCount: _options.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final bool isSelected = _selectedIndex == index;

                    return GestureDetector(
                      onTap: () => _onSelect(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFFFEEEE) // light red background
                              : Colors.white,
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFDB0011) // red border
                                : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            // 🖼️ Illustration
                            Image.asset(
                              _options[index]["imagePath"]!,
                              height: 80,
                              width: 100,
                              fit: BoxFit.contain,
                            ),

                            const SizedBox(width: 16),

                            // 📝 Label
                            Expanded(
                              child: Text(
                                _options[index]["label"]!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? const Color(0xFFDB0011)
                                      : Colors.black,
                                ),
                              ),
                            ),

                            // ✅ Checkmark when selected
                            if (isSelected)
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFFDB0011),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // 🔴 Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedIndex != null ? _onContinue : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDB0011),
                    disabledBackgroundColor: Colors
                        .grey
                        .shade300, // greyed out when nothing selected
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
