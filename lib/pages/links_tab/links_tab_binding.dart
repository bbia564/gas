import 'package:get/get.dart';

import '../links_first/links_first_logic.dart';
import '../links_second/links_second_logic.dart';
import 'links_tab_logic.dart';

class LinksTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinksTabLogic());
    Get.lazyPut(() => LinksFirstLogic());
    Get.lazyPut(() => LinksSecondLogic());
  }
}
