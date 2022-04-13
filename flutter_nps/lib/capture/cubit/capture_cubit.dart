// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc/bloc.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:firebase_provider/score_submit_model.dart';
import 'package:flutter_nps/capture/capture.dart';

class CaptureCubit extends Cubit<CaptureCubitState> {
  CaptureCubit({FirebaseProvider? firebaseProvider})
      : _firebaseProvider = firebaseProvider,
        super(CaptureCubitState.initial());

  final FirebaseProvider? _firebaseProvider;

  void selectScore({required int score}) => emit(state.copyWith(score: score));

  void chipToggled({required int index}) => state.chipIndexes.contains(index)
      ? _removeChipIndex(index: index)
      : _addChipIndex(index: index);

  void _addChipIndex({required int index}) =>
      emit(state.copyWith(chipIndexes: [...state.chipIndexes, index]));

  void _removeChipIndex({required int index}) => emit(
        state.copyWith(
          chipIndexes: [...state.chipIndexes.where((item) => item != index)],
        ),
      );

  void submitResult() {
    if (_firebaseProvider != null) {
      _firebaseProvider!.sendCustomerSatisfaction(
        scoreSubmit: ScoreSubmitModel(
          score: state.score,
          chipIndexes: state.chipIndexes,
        ),
      );
    }
  }
}
