import 'package:mocktail/mocktail.dart';
import 'package:send_data_service/score_submit_model.dart';
import 'package:send_data_service/send_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

class SendDataServiceMock extends Mock implements SendDataService {}

void main() {
  final score = ScoreSubmitModel(score: 1, chipIndexes: [0, 1]);
  test('SendDataService creates instance', () {
    final dataProvider = SendDataService();

    expect(dataProvider, isNotNull);
  });

  test('sendCustomerSatisfaction was called', () {
    final dataProvider = SendDataServiceMock();

    dataProvider.sendCustomerSatisfaction(scoreSubmit: score);

    verify(() => dataProvider.sendCustomerSatisfaction(scoreSubmit: score))
        .called(1);
  });
}
