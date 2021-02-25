import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meet_heroes/app/pages/home/repositories/home_repository.dart';

import 'home_getx_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeGetxController(
        HomeRepository(Get.find<GetConnect>(), GetStorage())));
  }
}
