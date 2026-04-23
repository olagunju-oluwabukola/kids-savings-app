// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../widget/top_bar.dart';
import '../widget/balance_card.dart';
import '../widget/quick_actions.dart';
import '../widget/spending_section.dart';
import '../widget/saving_plan_section.dart'; // Changed from saving_plan.dart
import '../widget/play_game_section.dart';
import '../widget/learn_section.dart';
import '../widget/bottom_nav.dart';

class ChildrenHomeScreen extends StatefulWidget {
  final String name;
  const ChildrenHomeScreen({super.key, required this.name});

  @override
  State<ChildrenHomeScreen> createState() => _ChildrenHomeScreenState();
}

class _ChildrenHomeScreenState extends State<ChildrenHomeScreen> {
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    BalanceCard(name: widget.name),
                    const SizedBox(height: 16),
                    const QuickActions(),
                    const SizedBox(height: 16),
                    const SpendingSection(),
                    const SizedBox(height: 16),
                    const SavingPlanSection(), // No const error now
                    const SizedBox(height: 16),
                    const PlayGameSection(),
                    const SizedBox(height: 16),
                    const LearnSection(),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
        onAddPressed: () {}, // Empty for now, handled by SavingPlanSection
      ),
    );
  }
}
