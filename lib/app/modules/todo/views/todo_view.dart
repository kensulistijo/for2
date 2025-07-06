import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:for2/app/components/card.dart';
import 'package:for2/app/components/datepicker_textfield.dart';
import 'package:for2/app/components/timepicker_textfield.dart';

import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});

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

    void addTodoForm() async {
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
                key: controller.todoFormKey,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
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
                            'Making new todo :3',
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
                            text: 'Todo title',
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
                        controller: controller.todoTitleController,
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
                            text: 'Todo Description',
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
                        controller: controller.todoDescriptionController,
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
                        controller: controller.todoStatusController,
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
                            text: 'Start Date',
                            children: [
                              TextSpan(
                                text: '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      DatePickerTextField(
                        onDateSelected: (date) {
                          controller.startDate.value = date;
                        },
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            text: 'Start Time',
                            children: [
                              TextSpan(
                                text: '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TimePickerTextfield(
                        onTimeSelected: (time) {
                          controller.startTime.value = time;
                        },
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            text: 'End Date',
                            children: [
                              TextSpan(
                                text: '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      DatePickerTextField(
                        onDateSelected: (date) {
                          controller.endDate.value = date;
                        },
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            text: 'End Time',
                            children: [
                              TextSpan(
                                text: '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TimePickerTextfield(
                        onTimeSelected: (time) {
                          controller.endTime.value = time;
                        },
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: controller.createTodo,
                        child: Text('FINALIZE TODO!!! WOWZERS!!'),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
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
              Tab(text: 'User 1', icon: Icon(Icons.person)),
              Tab(text: 'User 2', icon: Icon(Icons.person_2)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/sodachi.jpg',
                      width: double.infinity,
                      // height: 120,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.white,
                  ),
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
                      text: 'All todos planned: ',
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
                    itemCount: controller.todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      // String count = intl.NumberFormat("#,##0", "id_ID").format(controller.upcomingDates[index]['count']);
                      // int count = intl.NumberFormat("#,##0", "id_ID").parse(formattedNumber).toInt();
                      return CardComponent(
                        title: controller.todoList[index]['title'],
                        description: controller.todoList[index]['description'],
                        location: controller.todoList[index]['location'],
                        date: controller.todoList[index]['date'],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors
                                  .white, // ✅ Proper way to set background color
                          foregroundColor:
                              Colors.black, // Optional: sets text/icon color
                          side: BorderSide(
                            color: Colors.black,
                          ), // Optional: border
                        ),
                        onPressed: addTodoForm,
                        child: Text('ADD NEW TODO'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/kanbaru.jpg',
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.white,
                    child: DatePickerTextField(),
                  ),
                  // Container(
                  //   color: Colors.blue,
                  //   height: MediaQuery.of(context).size.height * 0.05,
                  // ),
                  Text.rich(
                    TextSpan(
                      text: 'All todos planned: ',
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
                    itemCount: controller.todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      // String count = intl.NumberFormat("#,##0", "id_ID").format(controller.upcomingDates[index]['count']);
                      // int count = intl.NumberFormat("#,##0", "id_ID").parse(formattedNumber).toInt();
                      return CardComponent(
                        title: controller.todoList[index]['title'],
                        description: controller.todoList[index]['description'],
                        location: controller.todoList[index]['location'],
                        date: controller.todoList[index]['date'],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors
                                  .white, // ✅ Proper way to set background color
                          foregroundColor:
                              Colors.black, // Optional: sets text/icon color
                          side: BorderSide(
                            color: Colors.black,
                          ), // Optional: border
                        ),
                        onPressed: addTodoForm,
                        child: Text('ADD NEW TODO'),
                      ),
                    ),
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
