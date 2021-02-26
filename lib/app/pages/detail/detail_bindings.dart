import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meet_heroes/app/pages/detail/repositories/detail_repository.dart';

import 'detail_getx_controller.dart';

class DetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailGetxController(DetailRepository(GetStorage())));
  }
}
