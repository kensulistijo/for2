import 'package:flutter/material.dart';
import 'package:for2/app/components/card.dart';
import 'package:for2/app/components/datepicker_textfield.dart';
import 'package:for2/app/components/timepicker_textfield.dart';

import 'package:get/get.dart';

import '../controllers/date_history_controller.dart';

class DateHistoryView extends GetView<DateHistoryController> {
  const DateHistoryView({super.key});
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
                key: controller.dateFormKey,
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
                      controller: controller.dateStatusController,
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
                      onPressed: controller.createDate,
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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: null,
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Planned', icon: Icon(Icons.calendar_month)),
              Tab(text: 'History', icon: Icon(Icons.timer_sharp)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.upcomingDates.length,
                    itemBuilder: (BuildContext context, int index) {
                      // String count = intl.NumberFormat("#,##0", "id_ID").format(controller.upcomingDates[index]['count']);
                      // int count = intl.NumberFormat("#,##0", "id_ID").parse(formattedNumber).toInt();
                      return CardComponent(
                        title: controller.upcomingDates[index]['title'],
                        description:
                            controller.upcomingDates[index]['description'],
                        location: controller.upcomingDates[index]['location'],
                        date: controller.upcomingDates[index]['date'],
                      );
                    },
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'All dates planned: ',
                      children: [
                        TextSpan(
                          text: '${controller.upcomingDates.length}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.plannedDates.length,
                    itemBuilder: (BuildContext context, int index) {
                      // String count = intl.NumberFormat("#,##0", "id_ID").format(controller.upcomingDates[index]['count']);
                      // int count = intl.NumberFormat("#,##0", "id_ID").parse(formattedNumber).toInt();
                      return CardComponent(
                        title: controller.plannedDates[index]['title'],
                        description:
                            controller.plannedDates[index]['description'],
                        location: controller.plannedDates[index]['location'],
                        date: controller.plannedDates[index]['date'],
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: addDateForm,
                    child: Text('ADD NEW DATE'),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.pastDates.length,
                    itemBuilder: (BuildContext context, int index) {
                      // String count = intl.NumberFormat("#,##0", "id_ID").format(controller.upcomingDates[index]['count']);
                      // int count = intl.NumberFormat("#,##0", "id_ID").parse(formattedNumber).toInt();
                      return CardComponent(
                        title: controller.pastDates[index]['title'],
                        description: controller.pastDates[index]['description'],
                        location: controller.pastDates[index]['location'],
                        date: controller.pastDates[index]['date'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
