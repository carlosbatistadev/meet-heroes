class SplashRepository {
  final restClient;
  final storage;

  SplashRepository(
    this.restClient,
    this.storage,
  );

  bool isTokencheckIfTouHaveASavedToken() {
    final _token = storage.read('token');

    if (_token != null) {
      restClient.baseUrl = 'https://www.superheroapi.com/api/$_token/';
      return true;
    }

    return false;
  }

  bool saveToken(String token) {
    storage.write('token', token);
    return true;
  }

  Future<bool> checkToken(String token) async {
    final _response =
        await restClient.get('https://www.superheroapi.com/api/$token/1');

    if (_response.body['response'] == 'error' &&
        _response.body['error'] == 'access denied') {
      return false;
    } else {
      saveToken(token);
      restClient.baseUrl = 'https://www.superheroapi.com/api/$token/';
      return true;
    }
  }
}
