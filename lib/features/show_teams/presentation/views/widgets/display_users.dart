import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/features/show_teams/presentation/manager/show_workers_cubit/show_workers_cubit.dart';
import 'package:dashboard/features/show_teams/presentation/views/widgets/delete_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayUsers extends StatelessWidget {
  const DisplayUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowWorkersCubit, ShowWorkersState>(
      builder: (context, state) {
        if (state is ShowWorkersSuccess) {
          return Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "اسم العامل  ",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "ايميل العامل ",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " المنصب الوظيفي ",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " حذف العامل ",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.workers.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.workers[index].user?.name ?? "",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                state.workers[index].user?.email ?? "",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                state.workers[index].user!.role ?? "",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                               DeleteButton(id: state.workers[index].id!,teamId: state.workers[index].maintenanceTeamId!,)
                            ],
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                            height: 20,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ));
        } else if (state is ShowWorkersFailureState) {
          return CustomError(message: state.errMessage);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
