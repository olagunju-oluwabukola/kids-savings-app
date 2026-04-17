import 'package:flutter/material.dart';
import 'package:hsbc/pages/guess_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0; // tracks which page we're on

  // All 3 onboarding pages content in one place
  final List<Map<String, String>> _pages = [
    {
      "imagePath": "assets/images/onboarding1.png",
      "title": "Learn about money",
      "description":
          "Let's get excited about money and learn together with fun games and exercises",
    },
    {
      "imagePath": "assets/images/onboarding2.png",
      "title": "Money Adventures",
      "description":
          "Don't have an HSBC account? No problem! With this app, you can still learn and plan your savings. Your parents can help you open an account and improve money habits. Let's start saving together!",
    },
    {
      "imagePath": "assets/images/onboarding3.png",
      "title": "Save and grow",
      "description":
          "Start to save your money and watch it grow! HSBC Kids Banking makes it easy-peasy! Let's start saving and growing your money together!",
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() => _currentPage++);
    } else {
      // Last page — go to guess screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GuessScreen()),
      );
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GuessScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentPage];
    final bool isLastPage = _currentPage == _pages.length - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(),

              // 🖼️ Illustration
              Image.asset(page["imagePath"]!, height: 280),

              const SizedBox(height: 32),

              // 📝 Title
              Text(
                page["title"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 12),

              // 💬 Description
              Text(
                page["description"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // 🔵 Page Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 20 : 8, // active is wider
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? const Color(0xFFDB0011) // HSBC red when active
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 🔴 Next / Let's get started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDB0011),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    isLastPage ? "Let's get started" : "Next",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              // ⬜ Skip Button (hidden on last page)
              if (!isLastPage)
                TextButton(
                  onPressed: _skip,
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
