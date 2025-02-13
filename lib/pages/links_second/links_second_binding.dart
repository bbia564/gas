import 'package:get/get.dart';

import 'links_second_logic.dart';

class LinksSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinksSecondLogic());
  }
}
