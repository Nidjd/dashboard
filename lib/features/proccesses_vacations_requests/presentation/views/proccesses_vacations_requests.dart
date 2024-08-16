import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/repos/get_vacations_repo/get_vacations_repo_impl.dart';
import 'package:dashboard/features/proccesses_vacations_requests/presentation/manager/get_vacations_cubit/get_vacations_cubit.dart';
import 'package:dashboard/features/proccesses_vacations_requests/presentation/views/widgets/proccesses_vacations_requests_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProccessesVacationsRequests extends StatelessWidget {
  const ProccessesVacationsRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.,
          children: [
            Expanded(
              child: BlocProvider(
                create: (context) =>
                    GetVacationsCubit(getIt.get<GetVacationsRepoImpl>())
                      ..getVacations(
                        token: prefs.getString('token')!,
                        endPoint: 'showhandlerequest',
                      ),
                child: const ProccessesVacationsRequestsBody(),
              ),
            ),
            Container(
              width: size.width * 0.2,
            )
          ],
        ),
      ),
    );
  }
}
