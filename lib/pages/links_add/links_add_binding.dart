import 'package:get/get.dart';

import 'links_add_logic.dart';

class LinksAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinksAddLogic());
  }
}
