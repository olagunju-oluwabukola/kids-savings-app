import 'package:flutter/material.dart';
import 'package:hsbc/widget/create_saving_plan_modal.dart';
import '../widget/top_bar.dart';
import '../widget/balance_card.dart';
import '../widget/quick_actions.dart';
import '../widget/spending_section.dart';
import '../widget/saving_plan.dart';
import '../widget/play_game.dart';
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
                    const SavingPlanSection(),
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
        onAddPressed: () => _showCreateSavingPlanModal(),
      ),
    );
  }

  void _showCreateSavingPlanModal() {
    final _planNameController = TextEditingController();
    final _amountController = TextEditingController(text: "0");
    final _noteController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => CreateSavingPlanModal(
        planNameController: _planNameController,
        amountController: _amountController,
        noteController: _noteController,
      ),
    );
  }
}
