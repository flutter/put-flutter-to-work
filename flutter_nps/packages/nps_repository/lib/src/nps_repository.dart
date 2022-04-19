import 'package:nps_repository/src/score_submit_model.dart';

class NpsRepository {
  const NpsRepository();

  Future<void> sendCustomerSatisfaction({
    required CustomerSatisfaction scoreSubmit,
  }) {
    // Here you can add your own code
    // Add your own service to obtain customer satisfaction score
    return Future.value();
  }
}
