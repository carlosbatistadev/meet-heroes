import 'package:get/get.dart';
import 'package:meet_heroes/app/shared/models/character_model.dart';

class DetailGetxController extends GetxController {
  final _repository;

  DetailGetxController(this._repository);

  CharacterModel character;

  @override
  void onInit() {
    character = Get.arguments;
    super.onInit();
  }
}
