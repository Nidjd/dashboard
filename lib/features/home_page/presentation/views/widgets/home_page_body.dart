import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/features/show_teams/presentation/views/show_teams.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/features/add_electrical/presentation/views/add_electrical.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/views/add_maintenance_worker.dart';

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
    ShowTeam(),
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
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: size.width * 0.5,
                      height: size.height * 0.3,
                      child: Image.asset("images/x.png"),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        //radius: .0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.engineering,
                          color: Colors.grey[500],
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
                      CircleAvatar(
                        //radius: .0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.kitchen,
                          color: Colors.grey[500],
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
                      CircleAvatar(
                        //radius: .0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.groups,
                          color: Colors.grey[500],
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
