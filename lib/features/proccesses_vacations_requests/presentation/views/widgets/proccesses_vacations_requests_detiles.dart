import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class ProccessesVacationsRequestsDetiles extends StatefulWidget {
  const ProccessesVacationsRequestsDetiles({super.key});

  @override
  State<ProccessesVacationsRequestsDetiles> createState() =>
      _ProccessesVacationsRequestsDetilesState();
}

class _ProccessesVacationsRequestsDetilesState
    extends State<ProccessesVacationsRequestsDetiles> {
  String _isApproved = "Approved";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                child: Column(children: [
                  Column(
                    children: [
                      const Padding(
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
                      const Divider(
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
                                    " Majd",
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
                                    "MAjd@gmail.com",
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
                                    " Team 1",
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
                                      "سبب طلب الإجازة",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    " مرض شديد",
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
                                  SizedBox(height: 30.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _isApproved = "Approved";
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue),
                                        child: Text(
                                          'Approved',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 30.0),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _isApproved = "Rejected";
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue),
                                        child: Text(
                                          'Rejected',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    _isApproved == 'Approved'
                                        ? 'Order is Approved'
                                        : 'Order is Rejected',
                                    // style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Center(
                            child: SizedBox(
                          width: size.width * 0.3,
                          height: size.height * 0.08,
                          child: CustomTextButton(
                            textStyle: TextStyle(color: Colors.white),
                            // backGroundColor: Colors.blue,
                            label: 'إنهاء طلب الصيانة',
                            onPressed: () {},
                            backGroundColor: Colors.blue,
                          ),
                        ))
                        // ... (previous code)
                      ])
                ]))));
  }
}
