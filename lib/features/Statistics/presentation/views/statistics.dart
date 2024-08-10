import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/Statistics/data/repos/get_reports_repo_impl.dart';
import 'package:dashboard/features/Statistics/presentation/manager/cubit/get_reports_cubit.dart';
import 'package:dashboard/features/Statistics/presentation/views/widgets/statistics_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetReportsCubit(getIt.get<GetReportsRepoImpl>(),)..getReports(token: prefs.getString('token')!, endPoint: 'report',),
      child: const StatisticsBody(),
    );
  }
}
