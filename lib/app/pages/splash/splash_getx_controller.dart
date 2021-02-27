import 'package:get/get.dart';
import 'package:meet_heroes/app/app_routes.dart';

class SplashGetxController extends GetxController {
  final _repository;
  SplashGetxController(this._repository);

  String tokenText = '';
  void changeTokenText(String value) => tokenText = value;

  void checkHasToken() async {
    await Future.delayed(Duration(seconds: 1));
    if (_repository.isTokencheckIfTouHaveASavedToken()) {
      Get.offAndToNamed(AppRoutes.HOME_ROUTE);
    }
  }

  void checkIfTheTokenIsValid() async {
    if (await _repository.checkToken(tokenText)) {
      Get.offAndToNamed(AppRoutes.HOME_ROUTE);
    } else {
      Get.rawSnackbar(
        message: 'Token Inválido!',
      );
    }
  }
}
