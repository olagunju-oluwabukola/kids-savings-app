import 'package:flutter/material.dart';
import 'package:hsbc/pages/onboarding_screen.dart';
import 'package:hsbc/pages/children_auth_screen.dart';
import 'package:hsbc/pages/youth_auth_screen.dart';
import 'package:hsbc/pages/parent_auth_screen.dart';

class AgeOption {
  final String label;
  final String imagePath;
  final Color color;
  final Color borderColor;

  const AgeOption({
    required this.label,
    required this.imagePath,
    required this.color,
    required this.borderColor,
  });
}

class GuessScreen extends StatefulWidget {
  const GuessScreen({super.key});

  @override
  State<GuessScreen> createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  int? _selectedIndex;

  final List<AgeOption> _options = const [
    AgeOption(
      label: "Children (5-11 years old)",
      imagePath: "assets/images/children.png",
      color: Color(0xFFFFF8E1),
      borderColor: Color(0xFFFFCC00),
    ),
    AgeOption(
      label: "Youths (12-17 years old)",
      imagePath: "assets/images/youths.png",
      color: Color(0xFFE1F5FE),
      borderColor: Color(0xFF29B6F6),
    ),
    AgeOption(
      label: "Parents",
      imagePath: "assets/images/parents.png",
      color: Color(0xFFFCE4EC),
      borderColor: Color(0xFFF48FB1),
    ),
  ];

  void _onSelect(int index) {
    setState(() => _selectedIndex = index);
  }

  void _onContinue() {
    if (_selectedIndex == null) return;

    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChildrenAuthScreen()),
      );
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const YouthAuthScreen()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ParentAuthScreen()),
      );
    }
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
              const SizedBox(height: 16),

              // 🔙 Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingScreen(),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "You are?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 32),

              Expanded(
                child: ListView.separated(
                  itemCount: _options.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final bool isSelected = _selectedIndex == index;
                    final AgeOption option = _options[index];

                    return GestureDetector(
                      onTap: () => _onSelect(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: option.color,
                          border: Border.all(
                            color: isSelected
                                ? option.borderColor
                                : Colors.transparent,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              option.imagePath,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              option.label,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedIndex != null ? _onContinue : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDB0011),
                    disabledBackgroundColor: Colors.grey.shade300,
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
