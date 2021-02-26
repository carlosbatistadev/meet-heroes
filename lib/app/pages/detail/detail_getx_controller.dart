import 'package:get/get.dart';
import 'package:meet_heroes/app/shared/models/character_model.dart';

class DetailGetxController extends GetxController {
  final _repository;

  DetailGetxController(this._repository);

  CharacterModel character;
  bool isFavorite = false;

  @override
  void onInit() {
    character = Get.arguments;
    _checkIfYouAreFavorite();
    super.onInit();
  }

  void _checkIfYouAreFavorite() {
    isFavorite = _repository.checkIfYouAreFavorite(character.id);
    update();
  }

  void changeFavorite() {
    if (isFavorite) {
      isFavorite = _repository.removeFavorite(character.id);
    } else {
      isFavorite = _repository.saveFavorite(character.id);
    }
    update();
  }
}
