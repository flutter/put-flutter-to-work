class CustomerSatisfaction {
  const CustomerSatisfaction({required this.score, required this.chipIndexes});

  final int score;
  final List<int> chipIndexes;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'score': score,
        'chipIndexes': chipIndexes,
      };
}
