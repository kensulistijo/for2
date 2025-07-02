import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final tempDates = [
    {'tes': 'Task 1', 'description': 'Description 1'},
    {'tes': 'Task 2', 'description': 'Description 2'},
    {'tes': 'Task 3', 'description': 'Description 3'},
    {'tes': 'Task 4', 'description': 'Description 4'},
    {'tes': 'Task 5', 'description': 'Description 5'},
  ];

  final TextEditingController dateTitleController = TextEditingController();
  RxList upcomingDates = [].obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final formKey = GlobalKey();

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
