import 'package:meet_heroes/app/shared/models/persona_model.dart';
import 'package:meet_heroes/app/shared/models/response_model.dart';

class HomeRepository {
  final restClient;
  final storage;

  HomeRepository(this.restClient, this.storage);

  Future<List<ResponseModel>> loadFavorites() async {
    List<ResponseModel> _data;
    final _favoritesId = storage.read('favorites');

    if (_favoritesId != null && !_favoritesId.isEmpty) {
      _data = [];

      for (String id in _favoritesId) {
        final _response = await restClient.get(id);

        if (_response.statusCode == 202) {
          final _responseSuccess = _response.body.toMap();
          final _responseModel =
              ResponseModel(response: _responseSuccess.response, results: [
            PersonaModel.fromMap(_responseSuccess),
          ]);

          _data.add(_responseModel);
        }
      }
    }
    return _data;
  }
}
