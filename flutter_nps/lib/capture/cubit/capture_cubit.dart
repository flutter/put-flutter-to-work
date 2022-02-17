// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_nps/flutter_nps.dart';

class CaptureCubit extends Cubit<CaptureCubitState> {
  CaptureCubit() : super(CaptureCubitState.initial());

  bool get isScoreSelected => state.score != -1;
  bool get canSubmit => state.score != -1 && state.chipIndexes.isNotEmpty;

  void selectScore({required int score}) => emit(state.copyWith(score: score));

  void chipToogled({required int index}) => state.chipIndexes.contains(index)
      ? removeChipIndex(index: index)
      : addChipIndex(index: index);

  @visibleForTesting
  void addChipIndex({required int index}) =>
      emit(state.copyWith(chipIndexes: [...state.chipIndexes, index]));

  @visibleForTesting
  void removeChipIndex({required int index}) => emit(
        state.copyWith(
          chipIndexes: [...state.chipIndexes.where((item) => item != index)],
        ),
      );

  void submitResult() {}

  void callNeedHelp() {}
}
