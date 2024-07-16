import 'package:dashboard/features/reporting/presentation/views/widgets/order_overview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_button.dart';
import 'show_datepicker.dart';

class ReportingBody extends StatelessWidget {
  const ReportingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: size.width,
                  child: const Text(
                    "التقارير ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  )),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  OrderOverview(
                    totalAndFirstMonth: 'عدد الطلبات الكلية ',
                    completedAndSecond: 'عدد الطلبات المنجزة ',
                    pendingAndRelativeChange: 'عدد الطبات قيد الانتظار',
                    numm: 1,
                    onPressed: () {},
                  ),
                  OrderOverview(
                    totalAndFirstMonth: 'عدد طلبات الشهر الأول  ',
                    completedAndSecond: 'عدد طلبات الشهر الثاني  ',
                    pendingAndRelativeChange: 'التغير النسبي',
                    numm: 2,
                    onPressed: () {},
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
