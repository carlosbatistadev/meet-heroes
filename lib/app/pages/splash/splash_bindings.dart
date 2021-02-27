import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meet_heroes/app/pages/splash/repositories/splash_repository.dart';
import 'package:meet_heroes/app/pages/splash/splash_getx_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashGetxController(
        SplashRepository(Get.find<GetConnect>(), GetStorage())));
  }
}
