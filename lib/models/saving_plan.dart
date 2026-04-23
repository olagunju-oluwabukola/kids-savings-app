class SavingPlan {
  final String id;
  final String name;
  final double amount;
  final String note;
  final double savedAmount;
  final DateTime createdAt;

  SavingPlan({
    required this.id,
    required this.name,
    required this.amount,
    required this.note,
    this.savedAmount = 0,
    required this.createdAt,
  });

  double get progress => savedAmount / amount;
}
