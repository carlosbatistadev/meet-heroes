import 'package:meet_heroes/app/shared/models/character_model.dart';

class SearchRepository {
  final restClient;

  SearchRepository(this.restClient);

  Future<List<CharacterModel>> search(String searchText) async {
    List<CharacterModel> _data = [];

    searchText = searchText.trim().toLowerCase().replaceAll(' ', '%20');

    final _response = await restClient.get('/search/$searchText');

    if (_response.statusCode == 200 || _response.statusCode == 202) {
      for (Map<String, dynamic> character in _response.body['results']) {
        _data.add(CharacterModel.fromMap(character));
      }
    }

    return _data;
  }
}
