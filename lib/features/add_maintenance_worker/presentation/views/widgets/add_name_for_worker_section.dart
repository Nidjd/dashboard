import 'package:dashboard/global_variable.dart';
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
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: size.width * 0.15,
                  child: const Text(
                    "الفرق ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  )),
              // SizedBox(
              //   width: size.width * 0.2,
              // ),

              SizedBox(
                height: size.height * 0.07,
                child: Row(
                  children: [
                    CustomTextButton(
                      backGroundColor: Colors.blue.shade500,
                      label: "اضافة عامل ",
                      icon: const Icon(
                        Icons.add,
                        size: 12,
                        color: Colors.white,
                      ),
                      textStyle: const TextStyle(color: Colors.white),
                      onPressed: () async {
                        if (idSelectedItem == null) {
                          showCustomAlertDialog(
                              context, "تحذير !", "رجاء اختر الفريق ");
                        } else {
                          if (nameWorker.text.isEmpty) {
                            showCustomAlertDialog(
                                context, "تحذير", "رجاء ادخل اسم العامل  !");
                          } else if (nameWorker.text.isNotEmpty) {
                            await BlocProvider.of<AddWorkerCubit>(context)
                                .addNewWorker(
                              name: nameWorker.text,
                              id: idSelectedItem!,
                            );
                            setState(() {});
                          }
                        }
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    SizedBox(
                      width: size.width * 0.2,
                      height: size.height * 0.06,
                      child: CustomTextFormFiled(
                        sizee: 0.2,
                        controller: nameWorker,
                        label: 'ادخل اسم العامل',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      listener: (BuildContext context, AddWorkerState state) {
        if (state is AddWorkerSuccess) {
          showCustomAlertDialog(context, "Information !",
              "Email : ${state.information.email} , Password : ${state.information.password}");
        } else if (state is AddWorkerLoading) {
          const CustomProgressIndicator();
        }
      },
    );
  }
}
