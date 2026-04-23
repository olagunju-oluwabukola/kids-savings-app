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
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              LearnCard(
                imagePath: "assets/images/learn1.png",
                title: "Where's money from?",
                reward: "\$0.5 gift card",
              ),
              SizedBox(width: 12),
              LearnCard(
                imagePath: "assets/images/learn2.png",
                title: "Invest money for 5-11",
                reward: "\$0.5 gift card",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
