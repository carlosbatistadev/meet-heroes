import 'package:get/get.dart';
import 'package:meet_heroes/app/pages/home/repositories/home_repository.dart';
import 'package:meet_heroes/app/shared/models/character_model.dart';

class HomeGetxController extends GetxController {
  final HomeRepository _repository;
  HomeGetxController(this._repository);

  List<CharacterModel> favorites = [];
  List<CharacterModel> characters = [];

  bool isLoading = false;
  _changeIsLoading(bool status) {
    isLoading = status;
    update();
  }

  //List<int> _ids = [1, 2, 3, 4, 5];
  List<int> _ids = [1];
  List<int> _fiveMoreIds() {
    return [
      _ids.last + 1,
      _ids.last + 2,
      _ids.last + 3,
      _ids.last + 4,
      _ids.last + 5
    ];
  }

  @override
  void onInit() async {
    _changeIsLoading(true);

    characters = await _repository.loadFiveCharacters(_ids);
    //favorites = await _repository.loadFavorites();

    _changeIsLoading(false);
    super.onInit();
  }

  void loadMoreCharacters() async {
    _changeIsLoading(true);

    final _fiveIds = _fiveMoreIds();
    characters += await _repository.loadFiveCharacters(_fiveIds);
    _ids += _fiveIds;

    _changeIsLoading(false);
  }
}
