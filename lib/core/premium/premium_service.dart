import 'package:flutter/foundation.dart';

class PremiumService extends ChangeNotifier {
  static final PremiumService _instance = PremiumService._internal();

  factory PremiumService() => _instance;

  PremiumService._internal();

  bool _isPremium = false;
  bool _isLoading = false;

  bool get isPremium => _isPremium;

  bool get isLoading => _isLoading;

  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    // Sprint 3.6
    // Şimdilik mock değer.
    // Sprint 3.7'de Google Play Billing'den okunacak.

    await Future.delayed(const Duration(milliseconds: 300));

    _isPremium = false;

    _isLoading = false;

    notifyListeners();
  }

  Future<void> activatePremium() async {
    _isPremium = true;
    notifyListeners();
  }

  Future<void> deactivatePremium() async {
    _isPremium = false;
    notifyListeners();
  }

  Future<void> restorePurchase() async {
    // Sprint 3.7
    notifyListeners();
  }

  Future<void> refreshStatus() async {
    notifyListeners();
  }
}