import 'package:bloc/bloc.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:nps_repository/nps_repository.dart';

class CaptureCubit extends Cubit<CaptureCubitState> {
  CaptureCubit({required NpsRepository npsRepository})
      : _npsRepository = npsRepository,
        super(CaptureCubitState.initial());

  final NpsRepository _npsRepository;

  void selectScore({required int score}) => emit(state.copyWith(score: score));

  void chipToggled({required int index}) {
    state.chipIndexes.contains(index)
        ? _removeChipIndex(index: index)
        : _addChipIndex(index: index);
  }

  void _addChipIndex({required int index}) =>
      emit(state.copyWith(chipIndexes: [...state.chipIndexes, index]));

  void _removeChipIndex({required int index}) => emit(
        state.copyWith(
          chipIndexes: [...state.chipIndexes.where((item) => item != index)],
        ),
      );

  Future<void> submitResult() async {
    await _npsRepository.sendCustomerSatisfaction(
      scoreSubmit: CustomerSatisfaction(
        score: state.score,
        chipIndexes: state.chipIndexes,
      ),
    );
  }
}
