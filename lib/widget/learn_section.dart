import 'package:flutter/material.dart';
import 'learn_card.dart';
import 'section_header.dart';

class LearnSection extends StatelessWidget {
  const LearnSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Learn",
          subtitle: "Learning, do exercise and earn your rewards",
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: const [
              LearnCard(
                imagePath: "assets/images/learn1.png",
                title: "Where do money come?",
                reward: "Earn \$0.50",
              ),
              SizedBox(width: 12),
              LearnCard(
                imagePath: "assets/images/learn2.png",
                title: "How to save money",
                reward: "Earn \$0.50",
              ),
              SizedBox(width: 12),
              LearnCard(
                imagePath: "assets/images/learn2.png",
                title: "Smart spending habits",
                reward: "Earn \$0.50",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
