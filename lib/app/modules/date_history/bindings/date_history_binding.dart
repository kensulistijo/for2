import 'package:get/get.dart';

import '../controllers/date_history_controller.dart';

class DateHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DateHistoryController>(
      () => DateHistoryController(),
    );
  }
}
