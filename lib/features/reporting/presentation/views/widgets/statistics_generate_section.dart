import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/features/reporting/presentation/manager/generate_statistics_cubit/generate_statistics_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsGenerateSection extends StatefulWidget {
  const StatisticsGenerateSection({super.key});

  @override
  State<StatisticsGenerateSection> createState() =>
      _StatisticsGenerateSectionState();
}

class _StatisticsGenerateSectionState extends State<StatisticsGenerateSection> {
  DateTime selectedFirstDate = DateTime.now();
  DateTime selectedSecondDate = DateTime.now();
  TextEditingController firstDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  Future<void> _selectFirstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedFirstDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedFirstDate) {
      setState(() {
        selectedFirstDate = picked;
        firstDate.text = "${selectedFirstDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectSecondDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedSecondDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedSecondDate) {
      setState(() {
        selectedSecondDate = picked;
        endDate.text = "${selectedSecondDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  void dispose() {
    firstDate.dispose();
    endDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateStatisticsCubit, GenerateStatisticsState>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  if (state is GenerateStatisticsSuccessState)
                    Text(
                      state.generateStatisticsModel.totalRequests.toString(),
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
                      "عدد الطلبات الكلية",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  if (state is GenerateStatisticsSuccessState)
                    Text(
                      state.generateStatisticsModel.completedRequests
                          .toString(),
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
                      "عدد الطلبات المنجزة",
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
                  if (state is GenerateStatisticsSuccessState)
                    Text(
                      state.generateStatisticsModel.pendingRequests.toString(),
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
                      "عدد الطلبات قيد الانتظار",
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
                          "${selectedFirstDate.toLocal()}".split(' ')[0],
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        if (state is GenerateStatisticsFailureState)
                          CustomError(message: state.errorMessage),
                        ElevatedButton(
                          onPressed: () {
                            _selectFirstDate(context);
                          },
                          child: const Text('اختر التاريخ الأول'),
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
                          "${selectedSecondDate.toLocal()}".split(' ')[0],
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _selectSecondDate(context);
                          },
                          child: const Text('اختر التاريخ الثاني'),
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
              child: state is GenerateStatisticsLoadingState
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
                        BlocProvider.of<GenerateStatisticsCubit>(context)
                            .generateStatistics(
                          startDate: firstDate.text,
                          endDate: endDate.text,
                          endPoint: 'generateStatistics',
                          token: prefs.getString('token')!,
                        );
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
