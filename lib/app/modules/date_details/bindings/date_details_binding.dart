import 'package:get/get.dart';

import '../controllers/date_details_controller.dart';

class DateDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DateDetailsController>(
      () => DateDetailsController(),
    );
  }
}
