import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CaptureCubitState', () {
    final initialCaptureCubitState = CaptureCubitState.initial();

    test('initial values are set to score: -1 and chipIndexes: []', () {
      expect(initialCaptureCubitState.chipIndexes, isEmpty);
      expect(initialCaptureCubitState.score, equals(-1));
    });

    test('initial state props returns array of props', () {
      expect(
        initialCaptureCubitState.props,
        contains(initialCaptureCubitState.score),
      );
      expect(
        initialCaptureCubitState.props,
        contains(initialCaptureCubitState.chipIndexes),
      );
    });

    group('copyWith', () {
      final capture = CaptureCubitState.initial();

      test('copies CaptureCubitState with changed values', () {
        expect(capture.score, equals(-1));
        expect(capture.chipIndexes, equals(<int>[]));

        final firstCapture = capture.copyWith(score: 1);

        expect(firstCapture.score, equals(1));
        expect(firstCapture.chipIndexes, equals(<int>[]));

        final secondCapture = firstCapture.copyWith(chipIndexes: [1]);

        expect(secondCapture.score, equals(1));
        expect(secondCapture.chipIndexes, equals([1]));
      });
    });
  });
}
