import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  //TODO: Implement TodoController
  RxString todoTitle = ''.obs;
  RxString todoDescription = ''.obs;
  RxDouble todoDuration = 0.00.obs;
  RxString todoStatus = ''.obs;
  // Rx<DateTime> todoStartDate = DateTime.now().obs;
  // Rx<DateTime> todoEndDate = DateTime.now().obs;
  RxList todoList = <Map<String, dynamic>>[].obs;
  Rxn<DateTime> startDate = Rxn<DateTime>();
  Rxn<TimeOfDay> startTime = Rxn<TimeOfDay>();
  Rxn<DateTime> endDate = Rxn<DateTime>();
  Rxn<TimeOfDay> endTime = Rxn<TimeOfDay>();

  RxString dateTitle = ''.obs;
  RxString dateDescription = ''.obs;
  RxDouble dateDuration = 0.00.obs;
  RxString dateStatus = ''.obs;
  Rx<DateTime> dateStartDate = DateTime.now().obs;
  Rx<DateTime> dateEndDate = DateTime.now().obs;
  RxString dateLocation = ''.obs;
  RxList upcomingDates = [].obs;

  final dateFormKey = GlobalKey();
  final todoFormKey = GlobalKey();

  final TextEditingController todoTitleController = TextEditingController();
  final TextEditingController todoDescriptionController =
      TextEditingController();
  final TextEditingController todoDurationController = TextEditingController();
  final TextEditingController todoStartController = TextEditingController();
  final TextEditingController todoEndController = TextEditingController();
  final TextEditingController todoStatusController = TextEditingController();
  final TextEditingController dateTitleController = TextEditingController();
  final TextEditingController dateDescriptionController =
      TextEditingController();
  final TextEditingController dateDurationController = TextEditingController();
  final TextEditingController dateStartController = TextEditingController();
  final TextEditingController dateEndController = TextEditingController();
  final TextEditingController dateStatusController = TextEditingController();
  final TextEditingController dateLocationController = TextEditingController();

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

  void getPlannedDates() async {
    await FirebaseFirestore.instance
        .collection('Dates')
        .where('status', isEqualTo: 'Planned')
        .get();
  }

  void getPlannedTodos() async {
    await FirebaseFirestore.instance
        .collection('Dates')
        .where('status', isEqualTo: 'Planned')
        .get();
  }

  void getAllDates(String userId) async {
    await FirebaseFirestore.instance
        .collection('Dates')
        .where('userid', isEqualTo: userId)
        .get();
  }

  void createDate() async {
    await FirebaseFirestore.instance.collection('Dates').add({
      'Title': dateTitleController.text,
      'Description': dateDescriptionController.text,
      'Start': dateStartController.text,
      'Location': dateLocationController.text,
      'Status': 'Planned',
    });
  }

  void createTodo() async {
    await FirebaseFirestore.instance.collection('Todo').add({
      'Title': todoTitleController.text,
      'Description': todoDescriptionController.text,
      'Start Date': startDate.value,
      'Start Time': '${startTime.value!.hour}:${startTime.value!.minute}',
      'End Date': endDate.value,
      'End Time': '${endTime.value!.hour}:${endTime.value!.minute}',
      'Status': 'Planned',
    });
  }

  void deleteDate() async {
    await FirebaseFirestore.instance.collection('Dates').doc('aaa').delete();
  }

  void deleteTodo() async {
    await FirebaseFirestore.instance.collection('Todo').doc('aaa').delete();
  }
}
