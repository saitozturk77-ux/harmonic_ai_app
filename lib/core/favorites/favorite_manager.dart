class FavoriteManager {
  FavoriteManager._();

  static final Set<int> _favorites = <int>{};

  //---------------------------------------------------------
  // CHECK
  //---------------------------------------------------------

  static bool isFavorite(int signalId) {
    return _favorites.contains(signalId);
  }

  //---------------------------------------------------------
  // ADD / REMOVE
  //---------------------------------------------------------

  static bool toggle(int signalId) {
    if (_favorites.contains(signalId)) {
      _favorites.remove(signalId);
      return false;
    }

    _favorites.add(signalId);
    return true;
  }

  //---------------------------------------------------------
  // GET ALL
  //---------------------------------------------------------

  static List<int> getAll() {
    return _favorites.toList();
  }

  //---------------------------------------------------------
  // CLEAR
  //---------------------------------------------------------

  static void clear() {
    _favorites.clear();
  }
}