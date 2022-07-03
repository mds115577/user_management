import 'package:get/get.dart';

import '../controllers/data_view_controller.dart';

class DataViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataViewController>(
      () => DataViewController(),
    );
  }
}
