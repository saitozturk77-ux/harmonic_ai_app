import 'signal_model.dart';

class SignalViewModel {
  /// AI tarafından üretilen gerçek sinyal
  final SignalModel signal;

  /// Kullanıcı bu sinyali açabilir mi?
  final bool locked;

  /// Premium rozeti gösterilsin mi?
  final bool showPremiumBadge;

  /// Kart bulanık gösterilsin mi?
  final bool blur;

  const SignalViewModel({
    required this.signal,
    required this.locked,
    this.showPremiumBadge = false,
    this.blur = false,
  });

  SignalViewModel copyWith({
    SignalModel? signal,
    bool? locked,
    bool? showPremiumBadge,
    bool? blur,
  }) {
    return SignalViewModel(
      signal: signal ?? this.signal,
      locked: locked ?? this.locked,
      showPremiumBadge:
          showPremiumBadge ?? this.showPremiumBadge,
      blur: blur ?? this.blur,
    );
  }
}