import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:send_data_service/score_submit_model.dart';

void main() {
  test('ScoreSubmitModel toJson translates corectly', () {
    final scoreSubmitModel = ScoreSubmitModel(chipIndexes: [0, 1], score: 1);

    final result = scoreSubmitModel.toJson();

    expect(result, jsonDecode(jsonEncode(scoreSubmitModel)));
  });
}
