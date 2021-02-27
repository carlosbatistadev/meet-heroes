import 'package:meet_heroes/app/shared/models/character_model.dart';

class HomeRepository {
  final restClient;

  HomeRepository(this.restClient);

  Future<List<CharacterModel>> loadFiveCharacters(List<int> _ids) async {
    List<CharacterModel> _data = [];

    for (int id in _ids) {
      final _response = await restClient.get(id.toString());

      if (_response.statusCode == 200 || _response.statusCode == 202) {
        final _characterModel = CharacterModel.fromMap(_response.body);

        _data.add(_characterModel);
      }
    }
    return _data;
  }
}
