import 'package:nps_repository/src/score_submit_model.dart';

class NpsRepository {
  const NpsRepository();

  Future<void> sendCustomerSatisfaction({
    required CustomerSatisfaction scoreSubmit,
  }) {
    // Add custom implementation here to report customer satisfaction.
    return Future.value();
  }
}
