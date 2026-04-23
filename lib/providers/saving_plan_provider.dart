import 'package:flutter/material.dart';
import '../models/saving_plan.dart';

class SavingPlanProvider extends ChangeNotifier {
  List<SavingPlan> _plans = [];

  List<SavingPlan> get plans => _plans;

  void addPlan(SavingPlan plan) {
    _plans.add(plan);
    notifyListeners();
  }

  void updateSavedAmount(String planId, double amount) {
    final index = _plans.indexWhere((plan) => plan.id == planId);
    if (index != -1) {
      _plans[index] = SavingPlan(
        id: _plans[index].id,
        name: _plans[index].name,
        amount: _plans[index].amount,
        note: _plans[index].note,
        savedAmount: _plans[index].savedAmount + amount,
        createdAt: _plans[index].createdAt,
      );
      notifyListeners();
    }
  }

  void deletePlan(String planId) {
    _plans.removeWhere((plan) => plan.id == planId);
    notifyListeners();
  }
}
