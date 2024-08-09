import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/core/widgets/custom_text_form_field.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/qr_code_page.dart';

import 'package:dashboard/features/processes_orders/data/models/show_scheduling_model/message.dart';
import 'package:dashboard/features/processes_orders/presentation/manager/update_request_by_admin_cubit/update_request_by_admin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<UpdateRequestByAdminCubit, UpdateRequestByAdminState>(
        builder: (context, state) {
          return Container(
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
            child: ListView(
              //  Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Padding(
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
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Text(
                          "حالة الضمان ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          "(اظغط للتحديث)",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = true;
                            setState(() {});
                            if (isSelected) {
                              warrantyStateController.text = 'مكفول';
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.green : Colors.transparent,
                            border: Border.all(
                              color: Colors.blue, // Set the color of the border
                              width: 2.0, // Set the thickness of the border
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
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          isSelected = false;
                          setState(() {});
                          if (isSelected == false) {
                            warrantyStateController.text = 'غير مكفول';
                          }
                        },
                        child: Container(
                          // child: ,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.transparent : Colors.red,
                            border: Border.all(
                              // Add the border
                              color: Colors.blue, // Set the color of the border
                              width: 2.0, // Set the thickness of the border
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
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "رقم العميل ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.data.number ?? " No Number",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(40, 8, 8, 8),
                  child: Text(
                    "القطع المستهلكة  ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        widget.data.consumableParts ?? "No Consumable parts",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 2,
                    indent: 15,
                    endIndent: 15),
                const Padding(
                  padding: EdgeInsets.fromLTRB(40, 8, 8, 8),
                  child: Text(
                    "الإصلاحات",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.data.repairs ?? "No Repairs",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 2,
                  indent: 1,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CustomTextFormFiled(
                        sizee: 0.2,
                        controller: priceController,
                        label: 'السعر النهائي',
                        option: true,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      state is UpdateRequestByAdminLoadingState
                          ? const CustomProgressIndicator()
                          : state is UpdateRequestByAdminFailureState
                              ? CustomError(message: state.errorMessage)
                              : CustomTextButton(
                                  label: 'إرسال',
                                  backGroundColor: Colors.blue,
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    double? price;
                                    try {
                                      price =
                                          double.parse(priceController.text);
                                    } catch (e) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => const Center(
                                          child: Text(
                                            "price should be double value",
                                          ),
                                        ),
                                      );
                                    }

                                    if (warrantyStateController.text.isNotEmpty && priceController.text.isNotEmpty) {
                                      BlocProvider.of<UpdateRequestByAdminCubit>(
                                            context)
                                        .updateRequestByAdmin(
                                      token: prefs.getString('token')!,
                                      endPoint: 'updateRequestByAdmin',
                                      id: widget.data.id!,
                                      salary: price!,
                                    );
                                    }
                                  },
                                ),
                                const SizedBox(width: 8,),
                      state is UpdateRequestByAdminSuccessState
                          ? Text(state.updateRequestByAdminModel.message!,style: const TextStyle(color: Colors.black,),)
                          : Container(),
                      Expanded(
                        child: SizedBox(
                          height: 250,
                          width: 100,
                          child: widget.data.qrCode == null
                              ? Container()
                              : QrCodePage(
                                  data: widget.data.qrCode,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
