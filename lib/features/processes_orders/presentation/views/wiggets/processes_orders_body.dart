import 'package:dashboard/core/widgets/custom_text_form_field.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/qr_code_page.dart';
import 'package:dashboard/features/processes_orders/presentation/views/wiggets/warranty_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProcessesOrdersBody extends StatefulWidget {
  const ProcessesOrdersBody({super.key});

  @override
  State<ProcessesOrdersBody> createState() => _ProcessesOrdersBodyState();
}

class _ProcessesOrdersBodyState extends State<ProcessesOrdersBody> {
  TextEditingController priceController = TextEditingController();
  String text = "مكفول ";

  @override
  void dispose() {
    priceController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: size.width * 0.47, // Set the desired width of the box
          height: size.height * 1, // Set the desired height of the box
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
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            text = "مكفول";
                            print("object");
                            print(text);
                          });
                        },
                        child: Container(
                          width: size.width * 0.08,
                          height: size.height * 0.1,
                          // child: ,
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                            border: Border.all(
                              // Add the border
                              color: Colors.blue, // Set the color of the border
                              width: 2.0, // Set the thickness of the border
                            ),
                          ),
                          child: Column(
                            children: [
                              // Text("hh"),
                              IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.calendarCheck,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    // setState(() {
                                    //   text == "مكفول";
                                    // });
                                    print(text);
                                  }),

                              Text(
                                "مكفول",
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
                          setState(() {
                            text = "غير مكفول ";

                            print(text);
                          });
                        },
                        child: Container(
                          width: size.width * 0.08,
                          height: size.height * 0.1,
                          // child: ,
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                            border: Border.all(
                              // Add the border
                              color: Colors.blue, // Set the color of the border
                              width: 2.0, // Set the thickness of the border
                            ),
                          ),
                          child: Column(
                            children: [
                              // Text("hh"),
                              IconButton(
                                  icon: Icon(
                                    Icons.warning,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {}),

                              Text(
                                "غير مكفول ",
                              )
                            ],
                          ),
                        ),
                      )
                      // WarrantyState(
                      //   icon: Icons.check_circle_sharp,
                      //   text: 'مكفول ',
                      //   isWarranted: true,
                      // ),
                      // SizedBox(
                      //   width: size.width * 0.02,
                      // ),
                      // WarrantyState(
                      //   icon: Icons.close,
                      //   text: 'غير مكفول ',
                      //   isWarranted: false,
                      // ),
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "0958636242",
                    style: TextStyle(
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "مروحة تبريد",
                        style: TextStyle(
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "تغير صباب الماء _تغير مؤقت الثلاجة",
                    style: TextStyle(
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
                      const Expanded(
                        child: SizedBox(
                          height: 250,
                          width: 100,
                          child: QrCodePage(
                            data:
                                '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',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
    );
  }
}
// class ProcessesOrdersBody extends StatelessWidget {
//   ProcessesOrdersBody({
//     super.key,
//   });
//   TextEditingController priceController = TextEditingController();

//   @override
//   void dispose() {
//     priceController.dispose();
//     // super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//           width: size.width * 0.47, // Set the desired width of the box
//           height: size.height * 1, // Set the desired height of the box
//           decoration: BoxDecoration(
//             color: Colors.white, // Set the background color
//             // borderRadius:
//             //   BorderRadius.circular(10.0), // Apply rounded corners
//             border: Border.all(
//               // Add the border
//               color: Colors.grey, // Set the color of the border
//               width: 2.0, // Set the thickness of the border
//             ),
//           ),
//           child: ListView(
//               //  Column(
//               //         crossAxisAlignment: CrossAxisAlignment.start,

//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     child: Text(
//                       "طلب جديد",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20),
//                     ),
//                   ),
//                 ),
//                 const Divider(
//                   color: Colors.grey,
//                   height: 20,
//                   thickness: 2,
//                   indent: 0,
//                   endIndent: 0,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     child: Row(
//                       children: [
//                         const Text(
//                           "حالة الضمان ",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15),
//                         ),
//                         Text(
//                           "(اظغط للتحديث)",
//                           style: TextStyle(
//                               color: Colors.grey[600],
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       WarrantyState(
//                         icon: Icons.check_circle_sharp,
//                         text: 'مكفول ',
//                         isWarranted: true,
//                       ),
//                       SizedBox(
//                         width: size.width * 0.02,
//                       ),
//                       WarrantyState(
//                         icon: Icons.close,
//                         text: 'غير مكفول ',
//                         isWarranted: false,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "رقم العميل ",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "0958636242",
//                     style: TextStyle(
//                         color: Colors.grey,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                 ),
//                 const Divider(
//                   color: Colors.grey,
//                   height: 20,
//                   thickness: 2,
//                   indent: 15,
//                   endIndent: 15,
//                 ),
//                 SizedBox(
//                   height: size.height * 0.02,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.fromLTRB(40, 8, 8, 8),
//                   child: Text(
//                     "القطع المستهلكة  ",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "مروحة تبريد",
//                         style: TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                     color: Colors.grey,
//                     height: 20,
//                     thickness: 2,
//                     indent: 15,
//                     endIndent: 15),
//                 const Padding(
//                   padding: EdgeInsets.fromLTRB(40, 8, 8, 8),
//                   child: Text(
//                     "الإصلاحات",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "تغير صباب الماء _تغير مؤقت الثلاجة",
//                     style: TextStyle(
//                         color: Colors.grey,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                 ),
//                 const Divider(
//                   color: Colors.grey,
//                   height: 20,
//                   thickness: 2,
//                   indent: 1,
//                   endIndent: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       CustomTextFormFiled(
//                         sizee: 0.2,
//                         controller: priceController,
//                         label: 'السعر النهائي',
//                         option: true,
//                         keyboardType: TextInputType.number,
//                       ),
//                       const Expanded(
//                         child: SizedBox(
//                           height: 250,
//                           width: 100,
//                           child: QrCodePage(
//                             data:
//                                 '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',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ])),
//     );
//   }
// }
  // Text(
  //                             "الإصلاحات",
  //                             style: TextStyle(
  //                                 color: Colors.black,
  //                                 fontWeight: FontWeight.bold,
  //                                 fontSize: 15),
  //                           ),
  //                           Center(
  //                             child: Text(
  //                               " تغير مؤقت الثلاجة",
  //                               style: TextStyle(
  //                                   color: Colors.grey,
  //                                   fontWeight: FontWeight.bold,
  //                                   fontSize: 15),
  //                             ),
  //                           ),