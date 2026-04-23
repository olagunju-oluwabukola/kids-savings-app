import 'package:flutter/material.dart';
import 'game_card.dart';
import 'section_header.dart';

class PlayGameSection extends StatelessWidget {
  const PlayGameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Play game",
          subtitle: "Play games and earn your rewards",
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              GameCard(
                imagePath: "assets/images/game1.png",
                title: "Crash Flow",
                reward: "\$0.5 gift card",
              ),
              SizedBox(width: 12),
              GameCard(
                imagePath: "assets/images/game1.png",
                title: "Acquire",
                reward: "\$0.5 gift card",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
