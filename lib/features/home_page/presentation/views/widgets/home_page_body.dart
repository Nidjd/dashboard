import 'package:dashboard/core/widgets/custom_text_button.dart';
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
  List<Widget> pages = [const AddMaintenanceWorker(), const AddElectrical()];
  int indexPage = 0;

  void changeIndexOfPages(int index) {
    setState(() {
      indexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Container(
            width: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.teal[300]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextButton(
                      backGroundColor: Colors.transparent,
                      label: "إضافة عامل",
                      onPressed: () => changeIndexOfPages(0),
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextButton(
                      backGroundColor: Colors.transparent,
                      label: "إضافة جهاز الكتروني",
                      onPressed: () => changeIndexOfPages(1),
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
      ),
    );
  }
}


