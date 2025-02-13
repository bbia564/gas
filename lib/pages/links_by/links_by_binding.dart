import 'package:get/get.dart';

import 'links_by_logic.dart';

class CuringRabuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
