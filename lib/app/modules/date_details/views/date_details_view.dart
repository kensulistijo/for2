import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/date_details_controller.dart';

class DateDetailsView extends GetView<DateDetailsController> {
  const DateDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DateDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DateDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
