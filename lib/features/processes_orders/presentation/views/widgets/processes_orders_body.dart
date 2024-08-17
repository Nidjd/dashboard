import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/core/widgets/custom_text_form_field.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/qr_code_page.dart';

import 'package:dashboard/features/processes_orders/data/models/show_scheduling_model/message.dart';
import 'package:dashboard/features/processes_orders/presentation/manager/update_request_by_admin_cubit/update_request_by_admin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProcessesOrdersBody extends StatefulWidget {
  final Message data;

  const ProcessesOrdersBody({super.key, required this.data});

  @override
  State<ProcessesOrdersBody> createState() => _ProcessesOrdersBodyState();
}

class _ProcessesOrdersBodyState extends State<ProcessesOrdersBody> {
  TextEditingController priceController = TextEditingController();
  TextEditingController warrantyStateController = TextEditingController();
  bool isSelected = false;

  @override
  void dispose() {
    priceController.dispose();
    warrantyStateController.dispose();
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocBuilder<UpdateRequestByAdminCubit, UpdateRequestByAdminState>(
          builder: (context, state) {
            return Container(
                height: size.height * 0.9,
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
                child: Column(children: [
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Text(
                            "طلب جديد",
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    "الإصلاحات",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.data.repairs ?? " No repairs",
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
                                    "القطع المستبدلة",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.data.consumableParts ??
                                      " No consumableParts",
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
                                    "حالة الطلب",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.data.requestState ??
                                      " No requestState",
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
                        height: size.height * 0.07,
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
                                    "تفاصيل الطلب",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.data.requestDetails ??
                                      " No requestDetails",
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
                                    "ملاحظات",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.data.notes ?? " No notes",
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
                        height: size.height * 0.07,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.3,
                            child: CustomTextFormFiled(
                              sizee: 0.1,
                              controller: priceController,
                              label: 'السعر النهائي',
                              option: true,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.1,
                                    width: size.width * 0.08,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSelected = true;
                                          setState(() {});
                                          if (isSelected) {
                                            warrantyStateController.text =
                                                'مكفول';
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.green
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: Colors
                                                .blue, // Set the color of the border
                                            width:
                                                2.0, // Set the thickness of the border
                                          ),
                                        ),
                                        child: const Column(
                                          children: [
                                            // Text("hh"),
                                            Icon(
                                              FontAwesomeIcons.calendarCheck,
                                              color: Colors.black,
                                            ),

                                            Text(
                                              "مكفول",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.1,
                                    width: size.width * 0.08,
                                    child: GestureDetector(
                                      onTap: () {
                                        isSelected = false;
                                        setState(() {});
                                        if (isSelected == false) {
                                          warrantyStateController.text =
                                              'غير مكفول';
                                        }
                                      },
                                      child: Container(
                                        // child: ,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.transparent
                                              : Colors.red,
                                          border: Border.all(
                                            // Add the border
                                            color: Colors
                                                .blue, // Set the color of the border
                                            width:
                                                2.0, // Set the thickness of the border
                                          ),
                                        ),
                                        child: const Column(
                                          children: [
                                            // Text("hh"),
                                            Icon(
                                              Icons.warning,
                                              color: Colors.black,
                                            ),

                                            Text(
                                              "غير مكفول ",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.2,
                            width: size.width * 0.3,
                            child: widget.data.qrCode == null
                                ? Container()
                                : QrCodePage(
                                    data: widget.data.qrCode,
                                  ),
                          ),
                        ],
                      ),
                      Center(
                        child: SizedBox(
                          width: size.width * 0.3,
                          height: size.height * 0.08,
                          child: state is UpdateRequestByAdminLoadingState
                              ? const CustomProgressIndicator()
                              : CustomTextButton(
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                  // backGroundColor: Colors.blue,
                                  label: 'إنهاء طلب الصيانة',
                                  onPressed: () async {
                                    if (priceController.text.isNotEmpty &&
                                        warrantyStateController
                                            .text.isNotEmpty) {
                                      await BlocProvider.of<
                                                  UpdateRequestByAdminCubit>(
                                              context)
                                          .updateRequestByAdmin(
                                              token: prefs.getString('token')!,
                                              endPoint: 'updateRequestByAdmin',
                                              id: widget.data.id!,
                                              salary: double.parse(
                                                priceController.text,
                                              ),
                                              warrantyState:
                                                  warrantyStateController.text);
                                    }
                                    sendNotificationToClient(
                                        "e5TegjhUQD6z7p37Q7upqA:APA91bE9q1POj2KrG_KsxNUHL42_EYDEaI6g9pRdDg_KOXOZ1EK7wbOnkVhdBpYHzPjR7jXTWEODnoCTt-v5kipEEoH0EWaaG4J8rA-qdll8NTjuDX1lD6xwpkwIPVZKODTNgkdP5ApI",
                                        "عزيزي العميل .تم الانتهاء من صيانة طلبك رقم 1234بتاريخ 15_4_2024تم اصلاح المشكلة التالية في جهازك :استبدال البطارية -فحص واصلاح ودة التبريد _اجمالي تكلفة الصيانة 5000مع تحيات فريق الصيانة ");
                                  },
                                  backGroundColor: Colors.blue,
                                ),
                        ),
                      ),
                      if (state is UpdateRequestByAdminSuccessState)
                        Text(
                          state.updateRequestByAdminModel.message!,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else if (state is UpdateRequestByAdminFailureState)
                        Text(
                          state.errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ],
                  ),
                ]));
          },
        ),
      ),
    );
  }
}
