import 'package:dashboard/constants.dart';
import 'package:dashboard/core/utils/custom_alert_dialog.dart';

import 'package:dashboard/core/widgets/custom_progress_indicator.dart';

import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/core/widgets/custom_text_form_field.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/manager/add_worker_cubit/add_worker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNameForWorkerSection extends StatefulWidget {
  const AddNameForWorkerSection({
    super.key,
  });

  @override
  State<AddNameForWorkerSection> createState() =>
      _AddNameForWorkerSectionState();
}

class _AddNameForWorkerSectionState extends State<AddNameForWorkerSection> {
  TextEditingController nameWorker = TextEditingController();

  @override
  void dispose() {
    nameWorker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<AddWorkerCubit, AddWorkerState>(
      child: Column(
        children: [
          CustomTextFormFiled(
            nameWorker: nameWorker,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SizedBox(
            width: size.width * 0.1,
            height: size.height * 0.05,
            child: CustomTextButton(
              backGroundColor: Colors.green,
              label: "Add Worker",
              onPressed: () async {
                if (idSelectedItem == null) {
                  showCustomAlertDialog(
                      context, "Warning !", "Please Select a team");
                } else {
                  if (nameWorker.text.isEmpty) {
                    showCustomAlertDialog(context, "Warning",
                        "Please enter the name of the worker !");
                  } else if (nameWorker.text.isNotEmpty) {
                    await BlocProvider.of<AddWorkerCubit>(context).addNewWorker(
                      name: nameWorker.text,
                      id: idSelectedItem!,
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
      listener: (BuildContext context, AddWorkerState state) {
        if (state is AddWorkerSuccess) {
          showCustomAlertDialog(context, "Information !",
              "Email : ${state.information.email} , Password : ${state.information.password}");
        } else if(state is AddWorkerLoading){
          const CustomProgressIndicator();
        }
      },
    );
  }
}
