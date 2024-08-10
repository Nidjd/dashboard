import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/scheduling_orders/data/repos/show_not_schedulong/show_not_schediling_repo_impl.dart';
import 'package:dashboard/features/scheduling_orders/presentation/manager/show_not_scheduling_cubit/show_not_scheduling_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/scheduling_orders_body.dart';

class SchedulingOrdersPage extends StatelessWidget {
  const SchedulingOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => ShowNotSchedulingCubit(getIt.get<ShowNotSchedilingRepoImpl>())..showNotScheduling(token: prefs.getString('token')!, endPoint: 'show_schedling_not',),
        child: const SchedulingOrdersBody(),
      ),
    );
  }
}
