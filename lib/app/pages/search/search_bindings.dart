import 'package:get/get.dart';
import 'package:meet_heroes/app/pages/search/repositories/search_repository.dart';
import 'package:meet_heroes/app/pages/search/search_getx_controller.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => SearchGetxController(SearchRepository(Get.find<GetConnect>())));
  }
}
