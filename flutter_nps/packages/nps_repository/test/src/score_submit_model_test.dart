import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nps_repository/nps_repository.dart';

void main() {
  test('ScoreSubmitModel toJson translates corectly', () {
    final scoreSubmitModel = ScoreSubmitModel(chipIndexes: [0, 1], score: 1);

    final result = scoreSubmitModel.toJson();

    expect(result, jsonDecode(jsonEncode(scoreSubmitModel)));
  });
}
