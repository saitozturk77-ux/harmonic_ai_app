enum SignalType {
  buy,
  sell,
  wait,
}

enum MarketCategory {
  forex,
  metals,
  crypto,
  indices,
}

enum ConfirmationType {
  ema,
  macd,
  rsi,
  trend,
  harmonic,
  candlestick,
  volume,
  ai,
}

enum SignalStatus {
  live,
  expired,
  cancelled,
  waiting,
}

class SignalModel {
  //-------------------------------------------------
  // ID
  //-------------------------------------------------

  final int signalId;

  //-------------------------------------------------
  // MARKET
  //-------------------------------------------------

  final String pair;

  final MarketCategory category;

  final String timeframe;

  //-------------------------------------------------
  // SIGNAL
  //-------------------------------------------------

  final SignalType signal;

  final SignalStatus status;

  final double confidence;

  //-------------------------------------------------
  // PRICE
  //-------------------------------------------------

  final double entry;

  final double stopLoss;

  final double takeProfit;

  final double riskReward;

  final double spread;

  final double atr;

  //-------------------------------------------------
  // AI
  //-------------------------------------------------

  final String engine;

  final List<ConfirmationType> confirmations;

  final double successRate;

  //-------------------------------------------------
  // TIME
  //-------------------------------------------------

  final DateTime createdAt;

  const SignalModel({
    required this.signalId,
    required this.pair,
    required this.category,
    required this.timeframe,
    required this.signal,
    required this.status,
    required this.confidence,
    required this.entry,
    required this.stopLoss,
    required this.takeProfit,
    required this.riskReward,
    required this.spread,
    required this.atr,
    required this.engine,
    required this.confirmations,
    required this.successRate,
    required this.createdAt,
  });

  //-------------------------------------------------
  // COPY WITH
  //-------------------------------------------------

  SignalModel copyWith({
    SignalStatus? status,
  }) {
    return SignalModel(
      signalId: signalId,
      pair: pair,
      category: category,
      timeframe: timeframe,
      signal: signal,
      status: status ?? this.status,
      confidence: confidence,
      entry: entry,
      stopLoss: stopLoss,
      takeProfit: takeProfit,
      riskReward: riskReward,
      spread: spread,
      atr: atr,
      engine: engine,
      confirmations: confirmations,
      successRate: successRate,
      createdAt: createdAt,
    );
  }
    //-------------------------------------------------
  // HELPERS
  //-------------------------------------------------

  bool get isBuy => signal == SignalType.buy;

  bool get isSell => signal == SignalType.sell;

  bool get isWaiting => signal == SignalType.wait;

  bool get isLive => status == SignalStatus.live;

  bool get isExpired => status == SignalStatus.expired;

  bool get isCancelled => status == SignalStatus.cancelled;

  bool get isWaitingStatus => status == SignalStatus.waiting;

  //-------------------------------------------------
  // DISPLAY TEXT
  //-------------------------------------------------

  String get signalText {
    switch (signal) {
      case SignalType.buy:
        return "BUY";

      case SignalType.sell:
        return "SELL";

      case SignalType.wait:
        return "WAIT";
    }
  }

  String get categoryText {
    switch (category) {
      case MarketCategory.forex:
        return "Forex";

      case MarketCategory.metals:
        return "Metals";

      case MarketCategory.crypto:
        return "Crypto";

      case MarketCategory.indices:
        return "Indices";
    }
  }

  String get statusText {
    switch (status) {
      case SignalStatus.live:
        return "LIVE";

      case SignalStatus.expired:
        return "EXPIRED";

      case SignalStatus.cancelled:
        return "CANCELLED";

      case SignalStatus.waiting:
        return "WAITING";
    }
  }

  //-------------------------------------------------
  // UI HELPERS
  //-------------------------------------------------

  int get confidencePercent => confidence.round();

  String get rrText => "1 : ${riskReward.toStringAsFixed(1)}";

  String get spreadText => spread.toStringAsFixed(1);

  String get atrText => atr.toStringAsFixed(2);

  String get successText =>
      "${successRate.toStringAsFixed(1)}%";

  //-------------------------------------------------
  // CONFIRMATIONS
  //-------------------------------------------------

  List<String> get confirmationNames {
    return confirmations.map((item) {
      switch (item) {
        case ConfirmationType.ema:
          return "EMA";

        case ConfirmationType.macd:
          return "MACD";

        case ConfirmationType.rsi:
          return "RSI";

        case ConfirmationType.trend:
          return "TREND";

        case ConfirmationType.harmonic:
          return "HARMONIC";

        case ConfirmationType.candlestick:
          return "CANDLE";

        case ConfirmationType.volume:
          return "VOLUME";

        case ConfirmationType.ai:
          return "AI";
      }
    }).toList();
  }
    //-------------------------------------------------
  // JSON
  //-------------------------------------------------

  factory SignalModel.fromJson(Map<String, dynamic> json) {
    return SignalModel(
      signalId: json["signalId"] as int,

      pair: json["pair"] as String,

      category: _categoryFromString(
        json["category"] as String,
      ),

      timeframe: json["timeframe"] as String,

      signal: _signalFromString(
        json["signal"] as String,
      ),

      status: _statusFromString(
        json["status"] as String,
      ),

      confidence: (json["confidence"] as num).toDouble(),

      entry: (json["entry"] as num).toDouble(),

      stopLoss: (json["stopLoss"] as num).toDouble(),

      takeProfit: (json["takeProfit"] as num).toDouble(),

      riskReward: (json["riskReward"] as num).toDouble(),

      spread: (json["spread"] as num).toDouble(),

      atr: (json["atr"] as num).toDouble(),

      engine: json["engine"] as String,

      confirmations: (json["confirmations"] as List)
          .map(
            (e) => _confirmationFromString(e as String),
          )
          .toList(),

      successRate:
          (json["successRate"] as num).toDouble(),

      createdAt: DateTime.parse(
        json["createdAt"] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "signalId": signalId,
      "pair": pair,
      "category": category.name,
      "timeframe": timeframe,
      "signal": signal.name.toUpperCase(),
      "status": status.name,
      "confidence": confidence,
      "entry": entry,
      "stopLoss": stopLoss,
      "takeProfit": takeProfit,
      "riskReward": riskReward,
      "spread": spread,
      "atr": atr,
      "engine": engine,
      "confirmations":
          confirmations.map((e) => e.name).toList(),
      "successRate": successRate,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  //-------------------------------------------------
  // ENUM PARSERS
  //-------------------------------------------------

  static SignalType _signalFromString(String value) {
    switch (value.toUpperCase()) {
      case "BUY":
        return SignalType.buy;

      case "SELL":
        return SignalType.sell;

      default:
        return SignalType.wait;
    }
  }

  static MarketCategory _categoryFromString(
      String value) {
    switch (value.toLowerCase()) {
      case "forex":
        return MarketCategory.forex;

      case "metals":
        return MarketCategory.metals;

      case "crypto":
        return MarketCategory.crypto;

      case "indices":
        return MarketCategory.indices;

      default:
        return MarketCategory.forex;
    }
  }

  static SignalStatus _statusFromString(
      String value) {
    switch (value.toLowerCase()) {
      case "live":
        return SignalStatus.live;

      case "expired":
        return SignalStatus.expired;

      case "cancelled":
        return SignalStatus.cancelled;

      default:
        return SignalStatus.waiting;
    }
  }

  static ConfirmationType _confirmationFromString(
      String value) {
    switch (value.toLowerCase()) {
      case "ema":
        return ConfirmationType.ema;

      case "macd":
        return ConfirmationType.macd;

      case "rsi":
        return ConfirmationType.rsi;

      case "trend":
        return ConfirmationType.trend;

      case "harmonic":
        return ConfirmationType.harmonic;

      case "candlestick":
        return ConfirmationType.candlestick;

      case "volume":
        return ConfirmationType.volume;

      default:
        return ConfirmationType.ai;
    }
  }
}