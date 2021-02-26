import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meet_heroes/app/pages/search/repositories/search_repository.dart';
import 'package:meet_heroes/app/shared/models/character_model.dart';

class SearchGetxController extends GetxController {
  final SearchRepository _repository;

  SearchGetxController(this._repository);

  List<CharacterModel> resultSearch = [];

  String searchText = '';
  changeSearch(String value) => searchText = value;

  bool isLoading = false;
  _changeIsLoading(bool status) {
    isLoading = status;
    update();
  }

  void search(String value) async {
    _changeIsLoading(true);

    resultSearch = await _repository.search(searchText);

    _changeIsLoading(false);
  }
}
