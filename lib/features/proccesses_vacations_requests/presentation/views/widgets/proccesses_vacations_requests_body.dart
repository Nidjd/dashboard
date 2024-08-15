import 'package:dashboard/features/proccesses_vacations_requests/presentation/views/widgets/proccesses_vacations_requests_detiles.dart';
import 'package:flutter/material.dart';

class ProccessesVacationsRequestsBody extends StatelessWidget {
  const ProccessesVacationsRequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: size.width * 0.5,
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
            child: ListView(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProccessesVacationsRequestsDetiles(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.assignment_turned_in,
                          color: Colors.blue,
                          size: 50.0,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: size.width * 0.45,
                          child: Column(
                            children: [
                              Center(
                                child: Row(
                                  children: [
                                    Text(
                                      "تاريخ تقديم طلب الإجازة :2024-08-21",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.blue,
                                      size: 18.0,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Center(
                                child: Row(
                                  children: [
                                    Text(
                                      "حالة الطلب  :Pending",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.blue,
                      height: 20,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ],
                ),
              )
            ])));
  }
}
