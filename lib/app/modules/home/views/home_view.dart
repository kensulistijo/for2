import 'package:flutter/material.dart';
import 'package:for2/app/components/boxmenu.dart';
import 'package:for2/app/components/card.dart';

import 'package:get/get.dart';
// import 'package:intl/intl.dart' as intl;

import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              '${controller.upcomingDates.length} dates upcoming!',
            ),
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
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      BoxMenu(
                        title: 'Dates',
                        // color: 
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      BoxMenu(
                        title: 'To-do List',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BoxMenu(
                        title: 'Schedule'
                      ),
                      SizedBox(
                        width: 5,
                      ), 
                      BoxMenu(
                        title: 'Watchlist'
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
