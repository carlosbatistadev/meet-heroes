import 'package:get/get.dart';
import 'package:meet_heroes/app/shared/models/character_model.dart';

class FavoritesGetxController extends GetxController {
  final _repository;

  FavoritesGetxController(this._repository);

  List<CharacterModel> favorites = [];

  bool isLoading = false;
  _changeIsLoading(bool status) {
    isLoading = status;
    update();
  }

  @override
  void onInit() async {
    _changeIsLoading(true);

    favorites = await _repository.loadFavorites();

    _changeIsLoading(false);
    super.onInit();
  }
}
