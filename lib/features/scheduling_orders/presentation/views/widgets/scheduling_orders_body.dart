import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/features/scheduling_orders/data/repos/schedule_repo/schedule_repo_impl.dart';
import 'package:dashboard/features/scheduling_orders/presentation/manager/schedule/schedule_cubit.dart';
import 'package:dashboard/features/scheduling_orders/presentation/manager/show_not_scheduling_cubit/show_not_scheduling_cubit.dart';
import 'package:dashboard/features/scheduling_orders/presentation/views/widgets/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulingOrdersBody extends StatefulWidget {
  const SchedulingOrdersBody({super.key});

  @override
  State<SchedulingOrdersBody> createState() => _SchedulingOrdersBodyState();
}

class _SchedulingOrdersBodyState extends State<SchedulingOrdersBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ShowNotSchedulingCubit, ShowNotSchedulingState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                    width: size.width,
                    child: const Text(
                      "جدولة الطلبات  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    )),
              ),
              Expanded(
                child: Container(
                  width: 1250,
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
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * 0.1,
                              child: const Text(
                                "رقم العميل  ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.1,
                              child: const Text(
                                "معرف الفريق",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.2,
                              child: const Text(
                                "الأيام المناسبة لقدوم فريق العمل ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.2,
                              child: const Text(
                                "ملاحظات",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                              child: const Text(
                                "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
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
                        child: state is ShowNotSchedulingSuccessState
                            ? ListView.builder(
                                itemCount: state
                                    .showNotSchedulingModel.message!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 8.0,
                                      top: 4.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.1,
                                          child: Text(
                                            state.showNotSchedulingModel
                                                    .message![index].number ??
                                                "",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.1,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: size.width * 0.02),
                                            child: Text(
                                              state.showNotSchedulingModel
                                                  .message![index].id
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.2,
                                          child: Text(
                                            state.showNotSchedulingModel
                                                    .message![index].freeDay ??
                                                "",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.2,
                                          child: Text(
                                            state.showNotSchedulingModel
                                                    .message![index].notes ??
                                                "",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                            width: size.width * 0.02,
                                            child: IconButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        BlocProvider(
                                                      create: (context) =>
                                                          ScheduleCubit(
                                                        getIt.get<
                                                            ScheduleRepoImpl>(),
                                                      ),
                                                      child: Schedule(
                                                        id: state
                                                            .showNotSchedulingModel
                                                            .message![index]
                                                            .id!,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.checklist,
                                                color: Colors.blue,
                                                size: 20,
                                              ),
                                            )),
                                        SizedBox(
                                            width: size.width * 0.02,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.blue,
                                                size: 20,
                                              ),
                                            )),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : state is ShowNotSchedulingLoadingState
                                ? const CustomProgressIndicator()
                                : state is ShowNotSchedulingFailureState
                                    ? CustomError(message: state.errorMessage)
                                    : Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
