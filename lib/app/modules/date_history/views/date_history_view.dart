import 'package:flutter/material.dart';
import 'package:for2/app/components/card.dart';

import 'package:get/get.dart';

import '../controllers/date_history_controller.dart';

class DateHistoryView extends GetView<DateHistoryController> {
  const DateHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabView Example'),
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
              child: 
                Column(
                  children: [
                    ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.upcomingDates.length,
                    itemBuilder: (BuildContext context, int index) {
                      // String count = intl.NumberFormat("#,##0", "id_ID").format(controller.upcomingDates[index]['count']);
                      // int count = intl.NumberFormat("#,##0", "id_ID").parse(formattedNumber).toInt();
                      return
                      CardComponent(
                        title: controller.upcomingDates[index]['title'],
                        description: controller.upcomingDates[index]['description'],
                        location: controller.upcomingDates[index]['location'],
                        date: controller.upcomingDates[index]['date'],
                      );
                    }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'All dates planned'
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.plannedDates.length,
                    itemBuilder: (BuildContext context, int index) {
                      // String count = intl.NumberFormat("#,##0", "id_ID").format(controller.upcomingDates[index]['count']);
                      // int count = intl.NumberFormat("#,##0", "id_ID").parse(formattedNumber).toInt();
                      return
                      CardComponent(
                        title: controller.plannedDates[index]['title'],
                        description: controller.plannedDates[index]['description'],
                        location: controller.plannedDates[index]['location'],
                        date: controller.plannedDates[index]['date'],
                      );
                    }
                  ),
                ],
              )
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
                  return
                  CardComponent(
                    title: controller.pastDates[index]['title'],
                    description: controller.pastDates[index]['description'],
                    location: controller.pastDates[index]['location'],
                    date: controller.pastDates[index]['date'],
                  );
                }
              ),
                ],
              )),
            Center(child: Text('Profile Page')),
          ],
        ),
      ),
    );
  }
}
