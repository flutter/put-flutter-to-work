// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nps_repository/nps_repository.dart';

class NpsRepositoryMock extends Mock implements NpsRepository {}

class ScoreSubmitModelMock extends Mock implements ScoreSubmitModel {}

void main() {
  late final NpsRepository npsRepository;
  group('CaptureCubit', () {
    setUpAll(() {
      npsRepository = NpsRepositoryMock();
      registerFallbackValue(ScoreSubmitModelMock());
    });
    test('initial state is set to score: -1 and chipIndexes: []', () {
      expect(
        CaptureCubit(npsRepository: npsRepository).state,
        equals(CaptureCubitState.initial()),
      );
    });

    blocTest<CaptureCubit, CaptureCubitState>(
      'selectScore sets score to 1',
      build: () => CaptureCubit(npsRepository: npsRepository),
      act: (cubit) => cubit.selectScore(score: 1),
      expect: () => [
        equals(const CaptureCubitState(score: 1, chipIndexes: [])),
      ],
    );

    blocTest<CaptureCubit, CaptureCubitState>(
      'addChipIndex adds index to chipIndexes',
      build: () => CaptureCubit(npsRepository: npsRepository),
      seed: () => const CaptureCubitState(score: -1, chipIndexes: []),
      act: (cubit) => cubit.chipToggled(index: 1),
      expect: () => [
        equals(const CaptureCubitState(score: -1, chipIndexes: [1])),
      ],
    );

    blocTest<CaptureCubit, CaptureCubitState>(
      'removeChipIndex from chipIndexes',
      build: () => CaptureCubit(npsRepository: npsRepository),
      seed: () => const CaptureCubitState(score: -1, chipIndexes: [1]),
      act: (cubit) => cubit.chipToggled(index: 1),
      expect: () => [
        equals(const CaptureCubitState(score: -1, chipIndexes: [])),
      ],
    );

    blocTest<CaptureCubit, CaptureCubitState>(
      'submitResult returns nothing',
      setUp: () {
        when(
          () => npsRepository.sendCustomerSatisfaction(
            scoreSubmit: any(named: 'scoreSubmit'),
          ),
        ).thenReturn(true);
      },
      build: () => CaptureCubit(npsRepository: npsRepository),
      seed: () => const CaptureCubitState(score: -1, chipIndexes: []),
      act: (cubit) => cubit.submitResult(),
      expect: () => <CaptureCubitState>[],
    );
  });
}
