import 'package:meet_heroes/app/shared/models/character_model.dart';

class FavoritesRepository {
  final restClient;
  final storage;

  FavoritesRepository(this.restClient, this.storage);

  Future<List<CharacterModel>> loadFavorites() async {
    List<CharacterModel> _data = [];
    final _favoritesId = storage.read('favorites');

    if (_favoritesId != null && _favoritesId.isNotEmpty) {
      for (String id in _favoritesId) {
        final _response = await restClient.get(id);

        if (_response.statusCode == 200 || _response.statusCode == 202) {
          final _responseSuccess = _response.body;
          final _characterModel = CharacterModel.fromMap(_responseSuccess);

          _data.add(_characterModel);
        }
      }
    }
    return _data;
  }
}
