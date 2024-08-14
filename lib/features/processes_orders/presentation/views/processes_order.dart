import 'package:dashboard/features/processes_orders/data/repos/update_request_by_admin_repo/update_request_by_admin_repo_impl.dart';
import 'package:dashboard/features/processes_orders/presentation/manager/update_request_by_admin_cubit/update_request_by_admin_cubit.dart';
import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/processes_orders/data/repos/show_scheduling_repo/show_scheduling_repo_impl.dart';
import 'package:dashboard/features/processes_orders/presentation/manager/show_scheduling_cubit/show_scheduling_cubit.dart';
import 'package:dashboard/features/processes_orders/presentation/views/widgets/show_scheduled_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProcessesOrder extends StatefulWidget {
  const ProcessesOrder({super.key});

  @override
  State<ProcessesOrder> createState() => _ProcessesOrderState();
}

class _ProcessesOrderState extends State<ProcessesOrder> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              ShowSchedulingCubit(getIt.get<ShowSchedulingRepoImpl>())
                ..showSceduling(
                    endPoint: 'show_schedling',
                    token: "Bearer ${prefs.getString('token')}"),
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.,
            children: [
              const Expanded(
                child: ShowScheduledOrders(),
              ),
              Container(
                width: size.width * 0.3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
