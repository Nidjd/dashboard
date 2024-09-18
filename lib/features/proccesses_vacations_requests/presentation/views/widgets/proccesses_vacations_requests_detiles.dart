import 'dart:convert';

import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/features/proccesses_vacations_requests/presentation/manager/leave_request_cubit/leave_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class ProccessesVacationsRequestsDetiles extends StatefulWidget {
  final String name;
  final String email;
  final String nameOfTeam;
  final String reason;
  final int id;
  final String idApplication;
  const ProccessesVacationsRequestsDetiles(
      {super.key,
      required this.name,
      required this.email,
      required this.nameOfTeam,
      required this.reason,
      required this.id, required this.idApplication});

  @override
  State<ProccessesVacationsRequestsDetiles> createState() =>
      _ProccessesVacationsRequestsDetilesState();
}

class _ProccessesVacationsRequestsDetilesState
    extends State<ProccessesVacationsRequestsDetiles> {
  String _isApproved = "Approved";

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
    return BlocBuilder<LeaveRequestCubit, LeaveRequestState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Container(
              height: size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color
                // borderRadius:
                //   BorderRadius.circular(10.0), // Apply rounded corners
                border: Border.all(
                  // Add the border
                  color: Colors.grey, // Set the color of the border
                  width: 2.0, // Set the thickness of the border
                ),
              ),
              child: Column(
                children: [
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Text(
                            "طلب إجازة",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ],
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.3,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: const Text(
                                    "اسم العامل",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: const Text(
                                    "البريد الالكتروني",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.email,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: const Text(
                                    "فريق العامل",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.nameOfTeam,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.3,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: const Text(
                                    "سبب الطلب ",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.reason,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: size.width * 0.05),
                          SizedBox(
                            width: size.width * 0.3,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: const Text(
                                    "حالة الطلب ",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 30.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _isApproved = "Approved";
                                          });
                                        },
                                        style: _isApproved == "Approved"
                                            ? ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue)
                                            : ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white),
                                        child: _isApproved == "Approved"
                                            ? const Text(
                                                'Approved',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            : const Text(
                                                'Approved',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              )),
                                    const SizedBox(width: 30.0),
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _isApproved = "Rejected";
                                          });
                                        },
                                        style: _isApproved == "Rejected"
                                            ? ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue)
                                            : ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white),
                                        child: _isApproved == "Rejected"
                                            ? const Text(
                                                'Rejected',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            : const Text(
                                                'Rejected',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              )),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: state is LeaveRequestLoadingState
                            ? const CustomProgressIndicator()
                            : SizedBox(
                                width: size.width * 0.3,
                                height: size.height * 0.08,
                                child: CustomTextButton(
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                  // backGroundColor: Colors.blue,
                                  label: 'إنهاء الطلب ',
                                  onPressed: () async {
                                    await BlocProvider.of<LeaveRequestCubit>(
                                            context)
                                        .leaveRequest(
                                            token: prefs.getString('token')!,
                                            endPoint: 'leaverequests',
                                            id: widget.id,
                                            status: _isApproved);

                                  await  sendNotificationToClient(
                                        widget.idApplication,
                                        'حالة طلبك هي : $_isApproved');
                                            
                                  },
                                  backGroundColor: Colors.blue,
                                ),
                              ),
                      ),
                      if (state is LeaveRequestSuccsessState)
                        Text(
                          state.leaveRequestModel.message!,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else if (state is LeaveRequestFailureState)
                        Text(
                          state.errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
