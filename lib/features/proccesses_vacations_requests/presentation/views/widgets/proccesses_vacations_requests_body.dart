import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/repos/leave_request_repo/leave_request_repo_impl.dart';
import 'package:dashboard/features/proccesses_vacations_requests/presentation/manager/get_vacations_cubit/get_vacations_cubit.dart';
import 'package:dashboard/features/proccesses_vacations_requests/presentation/manager/leave_request_cubit/leave_request_cubit.dart';
import 'package:dashboard/features/proccesses_vacations_requests/presentation/views/widgets/proccesses_vacations_requests_detiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProccessesVacationsRequestsBody extends StatelessWidget {
  const ProccessesVacationsRequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<GetVacationsCubit, GetVacationsState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: size.width * 0.6,
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color
              // borderRadius:
              //   BorderRadius.circular(10.0), // Apply rounded corners
              border: Border.all(
                // Add the border
                color: Colors.grey, // Set the color of the border
                width: 2.0, // Set the thickness of the border
              ),
            ),
            child: state is GetVacationsSuccessState
                ? ListView.builder(
                    itemCount: state.vacationsModel.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => LeaveRequestCubit(
                                    getIt.get<LeaveRequestRepoImpl>()),
                                child: ProccessesVacationsRequestsDetiles(
                                  name: state.vacationsModel[index].worker!
                                          .user!.name ??
                                      " ",
                                  email: state.vacationsModel[index].worker!
                                          .user?.email ??
                                      " ",
                                  nameOfTeam: state.vacationsModel[index].worker
                                          ?.team?.name ??
                                      "  ",
                                  reason: state.vacationsModel[index].reason ??
                                      "  ",
                                  id: state.vacationsModel[index].id!, idApplication:  state.vacationsModel[index].idApplication!,
                                ),
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: size.width * 0.5,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.assignment_turned_in,
                                    color: Colors.blue,
                                    size: 50.0,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.35,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                "تاريخ تقديم الطلب  :${state.vacationsModel[index].createdAt}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.date_range,
                                                color: Colors.blue,
                                                size: 18.0,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                "حالة الطلب  :${state.vacationsModel[index].status}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "_",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "نوع الطلب :${state.vacationsModel[index].type}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Divider(
                                color: Colors.blue,
                                height: 20,
                                thickness: 2,
                                indent: 0,
                                endIndent: 0,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : (state is GetVacationsFailureState)
                    ? CustomError(message: state.errorMessage)
                    : const CustomProgressIndicator(),
          ),
        );
      },
    );
  }
}
