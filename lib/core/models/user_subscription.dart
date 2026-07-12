enum UserSubscription {
  free,
  trial,
  premium,
}

extension UserSubscriptionExtension on UserSubscription {
  bool get isFree => this == UserSubscription.free;

  bool get isTrial => this == UserSubscription.trial;

  bool get isPremium => this == UserSubscription.premium;

  String get displayName {
    switch (this) {
      case UserSubscription.free:
        return 'Free';

      case UserSubscription.trial:
        return 'Trial';

      case UserSubscription.premium:
        return 'Premium';
    }
  }
}