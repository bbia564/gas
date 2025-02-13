import 'package:get/get.dart';

import 'links_by_logic.dart';

class LinksByBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
