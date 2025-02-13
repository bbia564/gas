import 'package:get/get.dart';

import 'links_records_logic.dart';

class LinksRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinksRecordsLogic());
  }
}
