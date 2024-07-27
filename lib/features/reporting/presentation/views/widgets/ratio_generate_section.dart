import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/features/reporting/presentation/manager/generate_ratio_cubit/generate_ratio_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RatioGenerateSection extends StatefulWidget {
  const RatioGenerateSection({super.key});

  @override
  State<RatioGenerateSection> createState() => _RatioGenerateSectionState();
}

class _RatioGenerateSectionState extends State<RatioGenerateSection> {
  DateTime selectedFirstMonth = DateTime.now();
  DateTime selectedEndMonth = DateTime.now();
  TextEditingController firstMonth = TextEditingController();
  TextEditingController endMonth = TextEditingController();

  Future<void> selectFirstMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedFirstMonth,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedFirstMonth) {
      setState(() {
        selectedFirstMonth = picked;
        firstMonth.text = "${selectedFirstMonth.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> selectEndMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedEndMonth,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEndMonth) {
      setState(() {
        selectedEndMonth = picked;
        endMonth.text = "${selectedEndMonth.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  void dispose() {
    firstMonth.dispose();
    endMonth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateRatioCubit, GenerateRatioState>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  if (state is GenerateRatioSuccessState)
                    Text(
                      state.generateRatioModel.ratio.toString(),
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
                    child: const Text(
                      "التغير النسبي",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  if (state is GenerateRatioSuccessState)
                    Text(
                      state.generateRatioModel.requestsStartMonth.toString(),
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
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                    child: const Text(
                      "عدد الطلبات في الشهر الأول",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  if (state is GenerateRatioSuccessState)
                    Text(
                      state.generateRatioModel.requestsEndMonth.toString(),
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
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    child: const Text(
                      "عدد الطلبات الشهر الثاني",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.28,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${selectedFirstMonth.toLocal()}"
                              .split(' ')[0]
                              .substring(0, 7),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        if (state is GenerateRatioFailureState)
                          CustomError(message: state.errorMessage),
                        ElevatedButton(
                          onPressed: () {
                            selectFirstMonth(context);
                          },
                          child: const Text('اختر الشهر الأول'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.28,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${selectedEndMonth.toLocal()}"
                              .split(' ')[0]
                              .substring(0, 7),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            selectEndMonth(context);
                          },
                          child: const Text('اختر الشهر الثاني'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
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
              child: state is GenerateRatioLoadingState
                  ? const CustomProgressIndicator()
                  : CustomTextButton(
                      icon: Icon(
                        Icons.insert_chart_outlined,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.013,
                      ),
                      label: 'طلب التقرير ',
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.013),
                      onPressed: () async {
                        await BlocProvider.of<GenerateRatioCubit>(context)
                            .generateRatio(
                                startMonth: firstMonth.text.substring(0, 7),
                                endMonth: endMonth.text.substring(0, 7),
                                endPoint: 'generateRatio',
                                token: prefs.getString('token')!);
                      },
                      backGroundColor: Colors.blue,
                    ),
            ),
          ),
        ],
      );
    });
  }
}
