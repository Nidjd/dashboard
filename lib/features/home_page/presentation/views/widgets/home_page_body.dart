import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/features/Statistics/presentation/views/statistics.dart';
import 'package:dashboard/features/processes_orders/presentation/views/processes_order.dart';
import 'package:dashboard/features/reporting/presentation/views/reporting.dart';
import 'package:dashboard/features/scheduling_orders/presentation/views/scheduling_orders_page.dart';
import 'package:dashboard/features/show_teams/presentation/views/show_teams.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/features/add_electrical/presentation/views/add_electrical.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/views/add_maintenance_worker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  List<Widget> pages = [
    const AddMaintenanceWorker(),
    const AddElectrical(),
    const ShowTeam(),
    const ProcessesOrder(),
    const Reporting(),
    const SchedulingOrdersPage(),
    const Statistics(),
  ];
  int indexPage = 0;

  void changeIndexOfPages(int index) {
    setState(() {
      indexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Row(
        children: [
          Container(
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListView(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      width: size.width * 0.5,
                      height: size.height * 0.3,
                      child: Image.asset("images/x.png"),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        //radius: .0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.engineering,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      CustomTextButton(
                        backGroundColor: Colors.transparent,
                        label: "إضافة عامل",
                        onPressed: () => changeIndexOfPages(0),
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        //radius: .0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.kitchen,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      CustomTextButton(
                        backGroundColor: Colors.transparent,
                        label: "إضافة جهاز الكتروني",
                        onPressed: () => changeIndexOfPages(1),
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        //radius: .0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          FontAwesomeIcons.recycle,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      CustomTextButton(
                        backGroundColor: Colors.transparent,
                        label: " معالجة الطلبات  ",
                        onPressed: () => changeIndexOfPages(3),
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        //radius: .0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.groups,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      CustomTextButton(
                        backGroundColor: Colors.transparent,
                        label: "الفرق ",
                        onPressed: () => changeIndexOfPages(2),
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        //radius: .0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.insert_chart_outlined,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      CustomTextButton(
                        backGroundColor: Colors.transparent,
                        label: "الإحصائيات ",
                        onPressed: () => changeIndexOfPages(4),
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        //radius: .0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.checklist,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      CustomTextButton(
                        backGroundColor: Colors.transparent,
                        label: "جدولة الطلبات   ",
                        onPressed: () => changeIndexOfPages(5),
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        //radius: .0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.assignment,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      CustomTextButton(
                        backGroundColor: Colors.transparent,
                        label: "التقارير ",
                        onPressed: () => changeIndexOfPages(6),
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              child: pages[indexPage],
            ),
          ),
        ],
      )),
    );
  }
}
