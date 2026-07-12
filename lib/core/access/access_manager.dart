import '../models/user_subscription.dart';

enum AppModule {
  signals,
  trends,
  harmonic,
  candlestick,
  scanner,
  events,
  riskCalculator,
}

class AccessManager {
  const AccessManager._();

  //---------------------------------------------------------
  // FREE VERSION
  //---------------------------------------------------------

  static const List<String> _freePairs = [
    'EURUSD',
  ];

  //---------------------------------------------------------
  // TRIAL VERSION
  //---------------------------------------------------------

  static const List<String> _trialPairs = [
    'EURUSD',
    'GBPUSD',
    'USDJPY',
    'USDCHF',
    'USDCAD',
    'AUDUSD',
    'NZDUSD',
    'EURJPY',
    'XAUUSD',
    'BTCUSD',
  ];

  //---------------------------------------------------------
  // PREMIUM VERSION
  //---------------------------------------------------------

  static const List<String> _premiumPairs = [
    'EURUSD',
    'GBPUSD',
    'USDJPY',
    'USDCHF',
    'USDCAD',
    'AUDUSD',
    'NZDUSD',
    'EURJPY',
    'EURGBP',
    'GBPJPY',
    'EURAUD',
    'EURAUD',
    'EURNZD',
    'AUDJPY',
    'CADJPY',
    'CHFJPY',
    'NZDJPY',
    'AUDCAD',
    'AUDCHF',
    'CADCHF',
    'EURCAD',
    'GBPAUD',
    'GBPCAD',
    'GBPCHF',
    'GBPNZD',
    'NZDCAD',
    'NZDCHF',

    'XAUUSD',
    'XAGUSD',

    'BTCUSD',
    'ETHUSD',

    'US30',
    'NAS100',
    'GER40',
  ];

  //---------------------------------------------------------
  // SUBSCRIPTION
  //---------------------------------------------------------

  static bool isTrial(UserSubscription subscription) =>
      subscription == UserSubscription.trial;

  static bool isFree(UserSubscription subscription) =>
      subscription == UserSubscription.free;

  static bool isPremium(UserSubscription subscription) =>
      subscription == UserSubscription.premium;

  //---------------------------------------------------------
  // PAIRS
  //---------------------------------------------------------

  static List<String> availablePairs(
      UserSubscription subscription) {
    if (isPremium(subscription)) {
      return _premiumPairs;
    }

    if (isTrial(subscription)) {
      return _trialPairs;
    }

    return _freePairs;
  }

  //---------------------------------------------------------
  // PAIR ACCESS
  //---------------------------------------------------------

  static bool canAccessPair({
    required String pair,
    required UserSubscription subscription,
  }) {
    return availablePairs(subscription).contains(pair);
  }

  static bool isLocked({
    required String pair,
    required UserSubscription subscription,
  }) {
    return !canAccessPair(
      pair: pair,
      subscription: subscription,
    );
  }

  //---------------------------------------------------------
  // MODULE ACCESS
  //---------------------------------------------------------

  static bool canAccessModule({
    required AppModule module,
    required UserSubscription subscription,
  }) {
    if (isPremium(subscription)) {
      return true;
    }

    if (isTrial(subscription)) {
      return true;
    }

    switch (module) {
      case AppModule.events:
      case AppModule.riskCalculator:
      case AppModule.signals:
      case AppModule.trends:
      case AppModule.harmonic:
      case AppModule.candlestick:
      case AppModule.scanner:
        return true;
    }
  }

  //---------------------------------------------------------
  // PREMIUM UI
  //---------------------------------------------------------

  static bool showPremiumBadge({
    required String pair,
    required UserSubscription subscription,
  }) {
    return isLocked(
      pair: pair,
      subscription: subscription,
    );
  }

  static bool shouldBlur({
    required String pair,
    required UserSubscription subscription,
  }) {
    return isLocked(
      pair: pair,
      subscription: subscription,
    );
  }

  static String premiumMessage(String pair) {
    return "$pair is available in Premium.";
  }
}