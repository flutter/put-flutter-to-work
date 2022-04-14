class ScoreSubmitModel {
  ScoreSubmitModel({required this.score, required this.chipIndexes});
  int score;
  List<int> chipIndexes;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'score': score,
        'chipIndexes': chipIndexes,
      };
}
