import 'package:cloud_firestore/cloud_firestore.dart';
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
  RxList upcomingDates = <Map<String, dynamic>>[].obs;
  RxList todayTodo = <Map<String, dynamic>>[].obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getAllDates();
    getTodoToday();
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

  // void getUpcomingDates() async {
  //   final now = DateTime.now();
  //   final nextMonth = DateTime(now.year, now.month + 30, now.day);
  //   final start = Timestamp.fromDate(now);
  //   final end = Timestamp.fromDate(nextMonth);

  //   final snapshot =
  //       await FirebaseFirestore.instance
  //           .collection('Dates')
  //           .where('Start date', isGreaterThanOrEqualTo: start)
  //           .where('Start date', isLessThanOrEqualTo: end)
  //           .orderBy('Start date')
  //           .get();

  //   final dates =
  //       snapshot.docs.map((doc) {
  //         final data = doc.data();
  //         return {'id': doc.id, ...data};
  //       }).toList();
  //   for (var doc in snapshot.docs) {
  //     print('${doc.id}: ${doc['title']}');
  //   }
  //   print(snapshot);
  //   print(dates);

  //   upcomingDates.value = dates;

  //   // upcomingDates.value = snapshot;
  // }

  void getAllDates() async {
    final snapshot = await FirebaseFirestore.instance.collection('Dates').get();
    final dates =
        snapshot.docs.map((doc) {
          final data = doc.data();
          return {'id': doc.id, ...data};
        }).toList();
    for (var doc in snapshot.docs) {
      print('${doc.id}: ${doc['Title']}');
    }

    upcomingDates.value = dates;
    print(upcomingDates);
  }

  void getTodoToday() async {
    final now = DateTime.now();

    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final snapshot =
        await FirebaseFirestore.instance
            .collection('Dates')
            .where('Start Date', isGreaterThanOrEqualTo: startOfDay)
            .where('Start Date', isLessThan: endOfDay)
            .orderBy('Start Date')
            .get();

    final todos =
        snapshot.docs.map((doc) {
          final data = doc.data();
          return {'id': doc.id, ...data};
        }).toList();

    todayTodo.value = todos;
    print(todayTodo);
  }
}
