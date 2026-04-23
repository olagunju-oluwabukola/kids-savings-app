import 'package:flutter/material.dart';
import 'package:hsbc/models/saving_plan.dart';
import 'package:provider/provider.dart';
import '../providers/saving_plan_provider.dart';
import 'saving_plan_card.dart';
import 'add_saving_card.dart';
import 'section_header.dart';
import 'create_saving_plan_modal.dart';

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
        Consumer<SavingPlanProvider>(
          builder: (context, provider, child) {
            final plans = provider.plans;

            if (plans.isEmpty) {
              return SizedBox(
                height: 130,
                child: Center(
                  child: GestureDetector(
                    onTap: () => _showCreatePlanModal(context),
                    child: const AddSavingCard(),
                  ),
                ),
              );
            }

            return SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...plans.map(
                    (plan) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SavingPlanCard(
                        id: plan.id,
                        title: plan.name,
                        amount: "\$${plan.amount.toStringAsFixed(0)}",
                        progress: plan.progress,
                        savedAmount: plan.savedAmount,
                        onTap: () => _showPlanDetails(context, plan),
                      ),
                    ),
                  ),
                  AddSavingCard(onTap: () => _showCreatePlanModal(context)),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  void _showCreatePlanModal(BuildContext context) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();
    final noteController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => CreateSavingPlanModal(
        nameController: nameController,
        amountController: amountController,
        noteController: noteController,
      ),
    );
  }

  void _showPlanDetails(BuildContext context, SavingPlan plan) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(plan.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Goal: \$${plan.amount.toStringAsFixed(0)}"),
            Text("Saved: \$${plan.savedAmount.toStringAsFixed(0)}"),
            Text(
              "Remaining: \$${(plan.amount - plan.savedAmount).toStringAsFixed(0)}",
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: plan.progress),
            const SizedBox(height: 8),
            Text("Note: ${plan.note}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
