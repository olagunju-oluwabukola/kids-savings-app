import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          "Learn About Savings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFDB0011),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Introduction Card
          _buildIntroCard(),
          const SizedBox(height: 16),

          // What is Saving?
          _buildLessonCard(
            title: "💰 What is Saving?",
            icon: Icons.savings,
            color: Colors.green,
            content:
                "Saving means keeping some of your money for later instead of spending it all now. Think of it like a squirrel collecting nuts for winter!",
            tips: [
              "• Saving helps you buy things you really want",
              "• It's good to save for emergencies",
              "• Start with small amounts, they add up!",
            ],
          ),
          const SizedBox(height: 16),

          // Why Save Money?
          _buildLessonCard(
            title: "🎯 Why Save Money?",
            icon: Icons.emoji_events,
            color: Colors.orange,
            content:
                "Saving money helps you achieve your dreams and be prepared for the future!",
            tips: [
              "• Buy special toys or games you really want",
              "• Help family or friends in need",
              "• Feel proud of reaching your goals",
              "• Learn to be responsible with money",
            ],
          ),
          const SizedBox(height: 16),

          // How to Start Saving?
          _buildLessonCard(
            title: "📝 How to Start Saving?",
            icon: Icons.checklist,
            color: Colors.blue,
            content: "Starting to save is easy! Follow these simple steps:",
            tips: [
              "1. Set a goal (like saving for a new bike)",
              "2. Decide how much to save each week",
              "3. Use a piggy bank or savings account",
              "4. Track your progress",
              "5. Celebrate when you reach your goal!",
            ],
          ),
          const SizedBox(height: 16),

          // Fun Ways to Save
          _buildLessonCard(
            title: "🎮 Fun Ways to Save",
            icon: Icons.celebration,
            color: Colors.purple,
            content: "Saving can be fun! Try these exciting methods:",
            tips: [
              "• Use a savings challenge chart",
              "• Turn saving into a game",
              "• Save all your coins in a fun piggy bank",
              "• Draw your progress on a poster",
              "• Save with a friend and compare progress",
            ],
          ),
          const SizedBox(height: 16),

          // Quiz Section
          _buildQuizCard(context), // Pass context here
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildIntroCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFDB0011), Color(0xFFFF6B6B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.lightbulb, size: 50, color: Colors.white),
          const SizedBox(height: 12),
          const Text(
            "Welcome to Money Smart!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            "Learning about money can be fun and exciting! Let's discover how to save and reach your dreams.",
            style: TextStyle(fontSize: 14, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Start Learning ➡️",
              style: TextStyle(
                color: Color(0xFFDB0011),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonCard({
    required String title,
    required IconData icon,
    required Color color,
    required String content,
    required List<String> tips,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, size: 30, color: color),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 12),
                ...tips.map(
                  (tip) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      tip,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDB0011), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.quiz, size: 50, color: Color(0xFFDB0011)),
          const SizedBox(height: 12),
          const Text(
            "Test Your Knowledge!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFDB0011),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Take a quick quiz to see what you've learned about saving money.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _showQuizDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDB0011),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Take Quiz ➡️",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showQuizDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const QuizDialog(),
    );
  }
}

class QuizDialog extends StatefulWidget {
  const QuizDialog({super.key});

  @override
  State<QuizDialog> createState() => _QuizDialogState();
}

class _QuizDialogState extends State<QuizDialog> {
  int _currentQuestion = 0;
  int _score = 0;
  bool _showResult = false;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What does it mean to save money?",
      "options": [
        "Spending all your money",
        "Keeping some money for later",
        "Giving money away",
        "Losing your money",
      ],
      "correct": 1,
      "explanation":
          "Saving means keeping some money for future use, not spending it all now!",
    },
    {
      "question": "Why is saving money important?",
      "options": [
        "To buy things you really want",
        "For emergencies",
        "To reach your goals",
        "All of the above",
      ],
      "correct": 3,
      "explanation": "All of these are great reasons to save money!",
    },
    {
      "question": "What's a good first step to start saving?",
      "options": [
        "Set a savings goal",
        "Spend all your money",
        "Ignore your money",
        "Only save once a year",
      ],
      "correct": 0,
      "explanation": "Setting a goal helps you stay motivated to save!",
    },
    {
      "question": "What can you use to save money at home?",
      "options": ["A shoe", "A piggy bank", "A book", "A toy car"],
      "correct": 1,
      "explanation":
          "A piggy bank is a fun way to save coins and small bills at home!",
    },
  ];

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == _questions[_currentQuestion]["correct"]) {
      _score++;
    }

    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
      });
    } else {
      setState(() {
        _showResult = true;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestion = 0;
      _score = 0;
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: _showResult ? _buildResult() : _buildQuestion(),
      ),
    );
  }

  Widget _buildQuestion() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Question ${_currentQuestion + 1}/${_questions.length}",
              style: const TextStyle(
                color: Color(0xFFDB0011),
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          _questions[_currentQuestion]["question"],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ...List.generate(
          _questions[_currentQuestion]["options"].length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _answerQuestion(index),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade100,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _questions[_currentQuestion]["options"][index],
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResult() {
    final percentage = (_score / _questions.length) * 100;
    String message;
    IconData icon;
    Color color;

    if (percentage == 100) {
      message = "Perfect! You're a money expert! 🌟";
      icon = Icons.emoji_events;
      color = Colors.amber;
    } else if (percentage >= 75) {
      message = "Great job! You know a lot about saving! 🎉";
      icon = Icons.thumb_up;
      color = Colors.green;
    } else if (percentage >= 50) {
      message = "Good try! Keep learning about money! 📚";
      icon = Icons.school;
      color = Colors.blue;
    } else {
      message = "Keep practicing! You'll get better at saving! 💪";
      icon = Icons.favorite;
      color = const Color(0xFFDB0011);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        Icon(icon, size: 80, color: color),
        const SizedBox(height: 16),
        Text(
          "Your Score: $_score/${_questions.length}",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "${percentage.toInt()}%",
          style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFDB0011)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Close"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _resetQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDB0011),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Retake Quiz"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
