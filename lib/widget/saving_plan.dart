import 'package:flutter/material.dart';
import 'saving_plan_card.dart';
import 'add_saving_card.dart';
import 'section_header.dart';

class SavingPlanSection extends StatelessWidget {
  const SavingPlanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Saving plan",
          subtitle: "Create saving goals and earn rewards",
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              SavingPlanCard(
                title: "Buying a bike circle",
                amount: "\$10",
                progress: 0.0,
              ),
              SizedBox(width: 12),
              SavingPlanCard(
                title: "Buying a bike circle",
                amount: "\$10",
                progress: 0.3,
              ),
              SizedBox(width: 12),
              AddSavingCard(),
            ],
          ),
        ),
      ],
    );
  }
}
