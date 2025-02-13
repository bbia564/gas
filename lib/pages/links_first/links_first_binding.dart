import 'package:get/get.dart';

import 'links_first_logic.dart';

class LinksFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinksFirstLogic());
  }
}
