// ignore_for_file: prefer_const_constructors, cascade_invocations
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nps_repository/nps_repository.dart';

class NpsRepositoryMock extends Mock implements NpsRepository {}

void main() {
  group('NpsRepository', () {
    final scoreSubmit = ScoreSubmitModel(score: 1, chipIndexes: [0, 1]);
    const npsRepository = NpsRepository();
    test('can be instantiated', () {
      expect(npsRepository, isNotNull);
    });

    test('sendCustomerSatisfaction was called', () {
      final result =
          npsRepository.sendCustomerSatisfaction(scoreSubmit: scoreSubmit);

      expect(result, isTrue);
    });
  });
}
