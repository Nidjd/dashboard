import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/views/add_maintenance_worker.dart';

import 'package:flutter/material.dart';

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
   
  ];
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
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CustomTextButton(
                      backGroundColor: Colors.green,
                      label: "Add Maintenance Worker",
                      onPressed: () => changeIndexOfPages(0),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          Expanded(
            child: pages[indexPage],
          ),
        ],
      ),
    );
  }
}
