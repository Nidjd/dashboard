import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/features/reporting/data/repos/generate_ratio_repo_impl.dart';
import 'package:dashboard/features/reporting/data/repos/generate_statistics_repo_impl.dart';
import 'package:dashboard/features/reporting/presentation/manager/generate_ratio_cubit/generate_ratio_cubit.dart';
import 'package:dashboard/features/reporting/presentation/manager/generate_statistics_cubit/generate_statistics_cubit.dart';
import 'package:dashboard/features/reporting/presentation/views/widgets/ratio_generate_section.dart';
import 'package:dashboard/features/reporting/presentation/views/widgets/statistics_generate_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportingBody extends StatefulWidget {
  const ReportingBody({
    super.key,
  });

  @override
  State<ReportingBody> createState() => _ReportingBodyState();
}

class _ReportingBodyState extends State<ReportingBody> {
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
                  //////////////////////
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: BlocProvider(
                       
                      create: (context) =>  GenerateStatisticsCubit(getIt.get<GenerateStatisticsRepoImpl>()),
                      child: const StatisticsGenerateSection(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ////////////////////// 
                   Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: BlocProvider(
                       
                      create: (context) =>  GenerateRatioCubit(getIt.get<GenerateRatioRepoImpl>()),
                      child: const RatioGenerateSection(),
                    ),
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
