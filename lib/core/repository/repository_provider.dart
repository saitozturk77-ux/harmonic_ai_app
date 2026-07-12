import '../datasource/json_signal_data_source.dart';
import 'signal_repository.dart';

class RepositoryProvider {
  RepositoryProvider._();

  static final SignalRepository signalRepository =
      SignalRepository(
    dataSource: const JsonSignalDataSource(),
  );
}