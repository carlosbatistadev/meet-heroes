class DetailRepository {
  final _storage;

  DetailRepository(this._storage);

  bool checkIfYouAreFavorite(String id) {
    bool isFavorite = false;

    final _data = _storage.read('favorites');
    if (_data != null && _data.contains(id)) {
      isFavorite = true;
    }

    return isFavorite;
  }

  bool saveFavorite(String id) {
    List<dynamic> _data = _storage.read('favorites');

    if (_data == null) {
      _data = [];
    }

    _data.add(id);
    _storage.write('favorites', _data);

    return true;
  }

  bool removeFavorite(String id) {
    List<dynamic> _data = _storage.read('favorites');
    _data.remove(id);
    _storage.write('favorites', _data);

    return false;
  }
}
