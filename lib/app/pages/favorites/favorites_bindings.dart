import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meet_heroes/app/pages/favorites/favorites_getx_controller.dart';
import 'package:meet_heroes/app/pages/favorites/repositories/favorites_repository.dart';

class FavoritesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FavoritesGetxController(
        FavoritesRepository(
          Get.find<GetConnect>(),
          GetStorage(),
        ),
      ),
    );
  }
}
