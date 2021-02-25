import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      final GetConnect _getConnect = GetConnect();
      _getConnect.baseUrl = 'https://superheroapi.com/api/2114412465359745/';
      return _getConnect;
    });
  }
}
