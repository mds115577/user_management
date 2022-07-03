import 'package:get/get.dart';

import '../controllers/single_page_view_controller.dart';

class SinglePageViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SinglePageViewController>(
      () => SinglePageViewController(),
    );
  }
}
