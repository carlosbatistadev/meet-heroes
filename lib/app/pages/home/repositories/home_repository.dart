import 'package:meet_heroes/app/shared/models/character_model.dart';
import 'package:meet_heroes/app/shared/models/response_model.dart';

class HomeRepository {
  final restClient;
  final storage;

  HomeRepository(this.restClient, this.storage);

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

          if (_data.length == 5) break;
        }
      }
    }
    return _data;
  }

  Future<List<CharacterModel>> loadFiveCharacters(List<int> _ids) async {
    List<CharacterModel> _data = [];

    for (int id in _ids) {
      final _response = await restClient.get(id.toString());

      if (_response.statusCode == 200 || _response.statusCode == 202) {
        final _responseSuccess = _response.body;
        final _characterModel = CharacterModel.fromMap(_responseSuccess);

        _data.add(_characterModel);
      }
    }
    return _data;
  }
}
