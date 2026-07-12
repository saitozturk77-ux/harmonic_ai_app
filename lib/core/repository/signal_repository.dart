import '../access/access_manager.dart';
import '../datasource/signal_data_source.dart';
import '../models/signal_model.dart';
import '../models/signal_view_model.dart';
import '../models/user_subscription.dart';

class SignalRepository {
  final SignalDataSource _dataSource;

  const SignalRepository({
    required SignalDataSource dataSource,
  }) : _dataSource = dataSource;

  //---------------------------------------------------------
  // GET SIGNALS
  //---------------------------------------------------------

  Future<List<SignalViewModel>> getSignals({
    required UserSubscription subscription,
    MarketCategory? category,
    String search = "",
  }) async {
    //-------------------------------------------------------
    // LOAD SIGNALS
    //-------------------------------------------------------

    final signals = await _dataSource.loadSignals();

    //-------------------------------------------------------
    // FILTER CATEGORY
    //-------------------------------------------------------

    Iterable<SignalModel> filtered = signals;

    if (category != null) {
      filtered = filtered.where(
        (signal) => signal.category == category,
      );
    }

    //-------------------------------------------------------
    // SEARCH
    //-------------------------------------------------------

    if (search.trim().isNotEmpty) {
      final keyword = search.trim().toUpperCase();

      filtered = filtered.where((signal) {
        return signal.pair.toUpperCase().contains(keyword) ||

            signal.category
                .name
                .toUpperCase()
                .contains(keyword) ||

            signal.engine
                .toUpperCase()
                .contains(keyword) ||

            signal.timeframe
                .toUpperCase()
                .contains(keyword);
      });
    }

    //-------------------------------------------------------
    // SORT
    //-------------------------------------------------------

    final sorted = filtered.toList()
      ..sort(
        (a, b) => b.confidence.compareTo(a.confidence),
      );

    //-------------------------------------------------------
    // VIEW MODEL
    //-------------------------------------------------------

    final List<SignalViewModel> result = [];
        //-------------------------------------------------------
    // ACCESS MANAGER
    //-------------------------------------------------------

    for (final signal in sorted) {
      final locked = AccessManager.isLocked(
        pair: signal.pair,
        subscription: subscription,
      );

      result.add(
        SignalViewModel(
          signal: signal,
          locked: locked,
          showPremiumBadge: locked,
          blur: locked,
        ),
      );
    }

    //-------------------------------------------------------
    // RETURN
    //-------------------------------------------------------

    return result;
  }

  //---------------------------------------------------------
  // FOREX
  //---------------------------------------------------------

  Future<List<SignalViewModel>> getForexSignals({
    required UserSubscription subscription,
  }) {
    return getSignals(
      subscription: subscription,
      category: MarketCategory.forex,
    );
  }

  //---------------------------------------------------------
  // METALS
  //---------------------------------------------------------

  Future<List<SignalViewModel>> getMetalSignals({
    required UserSubscription subscription,
  }) {
    return getSignals(
      subscription: subscription,
      category: MarketCategory.metals,
    );
  }

  //---------------------------------------------------------
  // CRYPTO
  //---------------------------------------------------------

  Future<List<SignalViewModel>> getCryptoSignals({
    required UserSubscription subscription,
  }) {
    return getSignals(
      subscription: subscription,
      category: MarketCategory.crypto,
    );
  }

  //---------------------------------------------------------
  // INDICES
  //---------------------------------------------------------

  Future<List<SignalViewModel>> getIndexSignals({
    required UserSubscription subscription,
  }) {
    return getSignals(
      subscription: subscription,
      category: MarketCategory.indices,
    );
  }
    //---------------------------------------------------------
  // SEARCH
  //---------------------------------------------------------

  Future<List<SignalViewModel>> searchSignals({
    required UserSubscription subscription,
    required String keyword,
  }) {
    return getSignals(
      subscription: subscription,
      search: keyword,
    );
  }

  //---------------------------------------------------------
  // PAIRS
  //---------------------------------------------------------

  Future<List<String>> getPairs({
    required UserSubscription subscription,
  }) async {
    final signals = await getSignals(
      subscription: subscription,
    );

    return signals
        .map((item) => item.signal.pair)
        .toSet()
        .toList()
      ..sort();
  }

  //---------------------------------------------------------
  // GET BY ID
  //---------------------------------------------------------

  Future<SignalViewModel?> getSignalById({
    required UserSubscription subscription,
    required int signalId,
  }) async {
    final signals = await getSignals(
      subscription: subscription,
    );

    try {
      return signals.firstWhere(
        (item) => item.signal.signalId == signalId,
      );
    } catch (_) {
      return null;
    }
  }

  //---------------------------------------------------------
  // TOP SIGNALS
  //---------------------------------------------------------

  Future<List<SignalViewModel>> getTopSignals({
    required UserSubscription subscription,
    int limit = 5,
  }) async {
    final signals = await getSignals(
      subscription: subscription,
    );

    return signals.take(limit).toList();
  }
}