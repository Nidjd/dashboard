import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/features/proccesses_vacations_requests/presentation/manager/cubit/get_vacations_cubit.dart';
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
                              builder: (context) =>
                                  ProccessesVacationsRequestsDetiles(
                                name: state.vacationsModel[index].worker!.user!
                                        .name ??
                                    " ",
                                email: state.vacationsModel[index].worker!.user!
                                        .email ??
                                    " ",
                                nameOfTeam: state.vacationsModel[index].worker!
                                        .team!.name ??
                                    "  ",
                                reason:
                                    state.vacationsModel[index].reason ?? "  ",
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
                                                "تاريخ تقديم طلب الإجازة :${state.vacationsModel[index].createdAt}",
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
