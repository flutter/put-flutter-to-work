import 'package:equatable/equatable.dart';

class CaptureCubitState extends Equatable {
  const CaptureCubitState({
    required this.score,
    required this.chipIndexes,
    this.maxScore = 5,
  });

  factory CaptureCubitState.initial() =>
      const CaptureCubitState(score: -1, chipIndexes: []);

  final int score;
  final List<int> chipIndexes;
  final int maxScore;

  CaptureCubitState copyWith({int? score, List<int>? chipIndexes}) =>
      CaptureCubitState(
        score: score ?? this.score,
        chipIndexes: chipIndexes ?? this.chipIndexes,
        maxScore: maxScore,
      );

  @override
  List<Object> get props => [score, chipIndexes, maxScore];
}
