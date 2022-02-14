import 'package:equatable/equatable.dart';

class CaptureCubitState extends Equatable {
  const CaptureCubitState({required this.score, required this.chipIndexes});

  factory CaptureCubitState.initial() =>
      const CaptureCubitState(score: -1, chipIndexes: []);

  final int score;
  final List<int> chipIndexes;

  CaptureCubitState copyWith({int? score, List<int>? chipIndexes}) =>
      CaptureCubitState(
        score: score ?? this.score,
        chipIndexes: chipIndexes ?? this.chipIndexes,
      );

  @override
  List<Object> get props => [score, chipIndexes];
}
