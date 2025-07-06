import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DateHistoryController extends GetxController {
  //TODO: Implement DateHistoryController
  RxList upcomingDates = [].obs;
  RxList plannedDates = [].obs;
  final now = DateTime.now().obs;
  RxList<DocumentSnapshot> pastDates = <DocumentSnapshot>[].obs;
  // Rx<DateTime> nextMonth = DateTime(now.year, now.month + 30, now.day).obs;
  Rx<DateTime> startDate = DateTime.now().obs;
  RxString dateTitle = ''.obs;
  RxString dateDescription = ''.obs;
  RxDouble dateDuration = 0.00.obs;
  RxString dateStatus = ''.obs;
  Rx<DateTime> dateStartDate = DateTime.now().obs;
  Rx<DateTime> dateEndDate = DateTime.now().obs;
  RxString dateLocation = ''.obs;

  final dateFormKey = GlobalKey();

  final start = Timestamp.fromDate(DateTime(2025, 5, 30));
  final end = Timestamp.fromDate(DateTime(2025, 7, 7));

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

  void getUpcomingDates() async {
    final now = DateTime.now();
    final nextMonth = DateTime(now.year, now.month + 30, now.day);
    final start = Timestamp.fromDate(now);
    final end = Timestamp.fromDate(nextMonth);

    final snapshot =
        await FirebaseFirestore.instance
            .collection('Dates')
            .where('Start date', isGreaterThanOrEqualTo: start)
            .where('Start date', isLessThanOrEqualTo: end)
            .orderBy('Start date')
            .get();
  }

  void getDatesByDateRange() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('Dates')
            .where('Start date', isGreaterThanOrEqualTo: startDate)
            .where('Start date', isLessThanOrEqualTo: end)
            .orderBy('Start date')
            .get();
  }

  void getAllPastDates() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('Dates')
            .where('status', isEqualTo: 'Completed')
            .where('userid', isEqualTo: 'x')
            .get();

    pastDates.value = snapshot.docs;
  }

  void getDateDetails(String docId) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Dates').doc(docId).get();
  }

  void createDate() async {
    await FirebaseFirestore.instance.collection('Dates').add({
      'title': dateTitle.value,
      'description': dateDescription.value,
      'start': dateStartDate.value,
      'location': dateLocation.value,
      'status': dateStatus.value,
    });
  }

  void increment() => count.value++;
}
