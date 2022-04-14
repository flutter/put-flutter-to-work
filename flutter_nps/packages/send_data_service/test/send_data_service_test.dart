import 'package:send_data_service/send_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SendDataService creates instance', () {
    final dataProvider = SendDataService();

    expect(dataProvider, isNotNull);
  });
}
