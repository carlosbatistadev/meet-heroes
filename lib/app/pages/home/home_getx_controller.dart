import 'package:get/get.dart';
import 'package:meet_heroes/app/pages/home/repositories/home_repository.dart';
import 'package:meet_heroes/app/shared/models/response_model.dart';

class HomeGetxController extends GetxController {
  final HomeRepository _repository;
  HomeGetxController(this._repository);

  List<ResponseModel> favorites;
}
