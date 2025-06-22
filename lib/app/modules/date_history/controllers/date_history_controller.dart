import 'package:get/get.dart';

class DateHistoryController extends GetxController {
  //TODO: Implement DateHistoryController
  RxList upcomingDates = [].obs;
  RxList plannedDates = [].obs;
  RxList pastDates = [].obs;
  
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
