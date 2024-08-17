import 'dart:convert';

import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/features/scheduling_orders/presentation/manager/schedule/schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class Schedule extends StatefulWidget {
  final int id;
  const Schedule({super.key, required this.id});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  TimeOfDay selectedFirstTime = TimeOfDay.now();
  TimeOfDay selectedSecondTime = TimeOfDay.now();
  DateTime selectedFirstDate = DateTime.now();
  DateTime selectedSecondDate = DateTime.now();
  TextEditingController firstDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController firstTime = TextEditingController();
  TextEditingController endTime = TextEditingController();

  Future<DateTime> selectFirstDate(
      BuildContext context, DateTime selectedFirstDatee) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedFirstDatee,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedFirstDatee) {
      setState(() {
        selectedFirstDatee = picked;
        firstDate.text = "${selectedFirstDatee.toLocal()}".split(' ')[0];
      });
    }
    return selectedFirstDatee;
  }

  Future<DateTime> selectEndDate(
      BuildContext context, DateTime selectedSecondDatee) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedSecondDatee,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedSecondDatee) {
      setState(() {
        selectedSecondDatee = picked;
        endDate.text = "${selectedSecondDatee.toLocal()}".split(' ')[0];
      });
    }
    return selectedSecondDatee;
  }

  Future<TimeOfDay> selectFirstTime(
      BuildContext context, TimeOfDay pickedTime) async {
    TimeOfDay? pickedTimefirst;

    pickedTimefirst = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 12, minute: 59),
    );
    if (pickedTimefirst != null) {
      setState(() {
        pickedTime = pickedTimefirst!;
        firstTime.text = "${pickedTime.hour.toString()}"
                ":"
                "${pickedTime.minute.toString()}"
            .split(' ')[0];
      });
    }
    return pickedTime;
  }

  Future<TimeOfDay> selectEndTime(
      BuildContext context, TimeOfDay pickedTime) async {
    TimeOfDay? pickedTimeEnd;

    pickedTimeEnd = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 12, minute: 59),
    );
    if (pickedTimeEnd != null) {
      setState(() {
        pickedTime = pickedTimeEnd!;
        endTime.text = "${pickedTime.hour.toString()}"
                ":"
                "${pickedTime.minute.toString()}"
            .split(' ')[0];
      });
    }
    return pickedTime;
  }

  @override
  void dispose() {
    firstDate.dispose();
    endDate.dispose();
    firstTime.dispose();
    endTime.dispose();
    super.dispose();
  }

  Future<void> sendNotificationToClient(
      String clientToken, String message) async {
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAZaaWJZM:APA91bGkr97K6LoCN8if6j4rohB9XZvCBOvk7mRyJzYKvorNVE3nxEWOlb8OvIfdUr8TGgsXH8R6foDVn93r4_eJwNoiqUmbG3SPfe1IoM0j2ej7fW3dauAgW-AVAvURV1_9cGsFhvJy',
    };

    final body = jsonEncode({
      'to': clientToken,
      'notification': {
        'title': 'Maintenance Request',
        'body': message,
      },
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Notification sent successfully');
      } else {
        print('Failed to send notification: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending notification: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return Expanded(
            child: Center(
              child: Container(
                width: size.width * 0.6,
                height: size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${selectedFirstTime.hour.toString()}"
                                            ":"
                                            "${selectedFirstTime.minute.toString()}"
                                        .split(' ')[0],
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      selectedFirstTime = await selectFirstTime(
                                          context, selectedFirstTime);
                                    },
                                    child: const Text('اختر الوقت'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${selectedFirstDate.toLocal()}"
                                        .split(' ')[0]
                                        .split(' ')[0],
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      selectedFirstDate = await selectFirstDate(
                                          context, selectedFirstDate);
                                    },
                                    child: const Text('اختر التاريخ الأول'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${selectedSecondTime.hour.toString()}"
                                            ":"
                                            "${selectedSecondTime.minute.toString()}"
                                        .split(' ')[0],
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      selectedSecondTime = await selectEndTime(
                                          context, selectedSecondTime);
                                    },
                                    child: const Text('اختر الوقت'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${selectedSecondDate.toLocal()}"
                                        .split(' ')[0]
                                        .split(' ')[0],
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      selectedSecondDate = await selectEndDate(
                                          context, selectedSecondDate);
                                    },
                                    child: const Text('اختر التاريخ الثاني'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        child: state is ScheduleLoadingState
                            ? const CustomProgressIndicator()
                            : CustomTextButton(
                                label: "جدولة طلب الصيانة",
                                onPressed: () async {
                                  // print("First Date is : ${firstDate.text}");
                                  // print("End Date is : ${endDate.text}");
                                  // print("First Time is : ${firstTime.text}");
                                  // print("End Time is : ${endTime.text}");
                                  if (firstTime.text.isNotEmpty &&
                                      endTime.text.isNotEmpty &&
                                      firstDate.text.isNotEmpty &&
                                      endDate.text.isNotEmpty) {
                                    String finalFirstTime =
                                        "${firstDate.text} ${firstTime.text}";
                                    String finalEndTime =
                                        "${endDate.text} ${endTime.text}";
                                    BlocProvider.of<ScheduleCubit>(context)
                                        .schedule(
                                      endPoint: 'schedling',
                                      token: prefs.getString('token')!,
                                      startTime: finalFirstTime,
                                      endTime: finalEndTime,
                                      id: widget.id,
                                    );
                                  }
                                  sendNotificationToClient("", "mmmmm");
                                },
                                backGroundColor: Colors.blue,
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (state is ScheduleSuccessState)
                        Text(
                          state.scheduleModel.message!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else if (state is ScheduleFailureState)
                        Text(
                          state.errMessage,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
