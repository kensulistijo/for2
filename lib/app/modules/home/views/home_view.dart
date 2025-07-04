import 'package:flutter/material.dart';
import 'package:for2/app/components/boxmenu.dart';
import 'package:for2/app/components/card.dart';
import 'package:for2/app/components/datepicker_textfield.dart';
import 'package:for2/app/components/timepicker_textfield.dart';

import 'package:get/get.dart';
// import 'package:intl/intl.dart' as intl;

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    void addDateForm() async {
      Get.bottomSheet(
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => Get.back(),
                        ),
                        Text(
                          'Making new date :3',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text: 'Date title',
                          children: [
                            TextSpan(
                              text: '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextFormField(
                      // controller: dateTitleController.text,
                      decoration: InputDecoration(
                        hintText: 'hihi',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text: 'Date Description',
                          children: [
                            TextSpan(
                              text: '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextFormField(
                      // controller: dateTitleController.text,
                      decoration: InputDecoration(
                        hintText: 'hihi',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Status'),
                    ),
                    TextFormField(
                      controller: controller.statusController,
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: 'Planned',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text: 'Date of Date',
                          children: [
                            TextSpan(
                              text: '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DatePickerTextField(),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text: 'Time of Date',
                          children: [
                            TextSpan(
                              text: '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TimePickerTextfield(),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: null,
                      child: Text('FINALIZE DATE!!! YIPPIEEE!!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        isScrollControlled: true,
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text('UPCOMING DATES!!'),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.tempDates.length,
                itemBuilder: (context, index) {
                  final dates = controller.tempDates[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tes',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tes',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Align(alignment: Alignment.center, child: Text('Todo today!')),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.tempDates.length,
                itemBuilder: (context, index) {
                  final dates = controller.tempDates[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tes',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tes',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: addDateForm,
                child: Text('Add a new date!'),
              ),
              ElevatedButton(onPressed: controller.tes, child: Text('tes')),
            ],
          ),
        ),
      ),
    );
  }
}
