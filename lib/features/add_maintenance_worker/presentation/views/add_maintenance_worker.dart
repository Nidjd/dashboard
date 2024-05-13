import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddMaintenanceWorker extends StatefulWidget {
  const AddMaintenanceWorker({super.key});

  @override
  State<AddMaintenanceWorker> createState() => _AddMaintenanceWorkerState();
}

class _AddMaintenanceWorkerState extends State<AddMaintenanceWorker> {
  TextEditingController nameWorker = TextEditingController();

  @override
  void dispose() {
    nameWorker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              CustomTextFormFiled(nameWorker: nameWorker),
               SizedBox(
                height: size.height *0.05,
              ),
              SizedBox(
                width: size.width * 0.1,
                height: size.height * 0.05,
                child: CustomTextButton(
                  backGroundColor: Colors.green,
                  label: "Add Worker",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
