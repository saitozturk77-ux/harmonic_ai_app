import '../models/signal_model.dart';

abstract class SignalDataSource {
  Future<List<SignalModel>> loadSignals();
}