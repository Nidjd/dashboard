import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/features/reporting/presentation/views/widgets/show_datepicker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderOverview extends StatelessWidget {
  final String totalAndFirstMonth;
  final String completedAndSecond;
  final String pendingAndRelativeChange;
  final int numm;
  final VoidCallback onPressed;

  const OrderOverview(
      {super.key,
      required this.totalAndFirstMonth,
      required this.completedAndSecond,
      required this.pendingAndRelativeChange,
      required this.numm, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Column(
                children: [
                  Text(
                    "0",
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    child: Text(
                      totalAndFirstMonth,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Text(
                    "0",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                    child: Text(
                      completedAndSecond,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
              Container(
                  child: Column(
                children: [
                  const Text(
                    "0",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    child: Text(
                      pendingAndRelativeChange,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
            ],
          ),
          const SizedBox(
            height: 80,
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 100,
                child: Center(child: ShowDatepicker(numm: numm))),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.14,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            child: CustomTextButton(
              icon: Icon(
                Icons.insert_chart_outlined,
                color: Colors.white,
                size: MediaQuery.of(context).size.width * 0.013,
              ),
              label: 'طلب التقرير ',
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.013),
              onPressed:onPressed,
              backGroundColor: Colors.blue,
            ),
          ),
          //   Text("data"),
        ],
      ),
    );
  }
}
