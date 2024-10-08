import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/features/processes_orders/data/repos/update_request_by_admin_repo/update_request_by_admin_repo_impl.dart';
import 'package:dashboard/features/processes_orders/presentation/manager/show_scheduling_cubit/show_scheduling_cubit.dart';
import 'package:dashboard/features/processes_orders/presentation/manager/update_request_by_admin_cubit/update_request_by_admin_cubit.dart';
import 'package:dashboard/features/processes_orders/presentation/views/widgets/processes_orders_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ShowScheduledOrders extends StatefulWidget {
  const ShowScheduledOrders({super.key});

  @override
  State<ShowScheduledOrders> createState() => _ShowScheduledOrdersState();
}

class _ShowScheduledOrdersState extends State<ShowScheduledOrders> {
  Future<String> getReverseGeocoding(String latitude, String longitude) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$latitude&lon=$longitude');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final displayName = data['display_name'] as String;
      final addressParts = displayName.split(', ');
      String name = addressParts[0];
      String suburb = addressParts[1];
      String street = addressParts[2];

      return '$name, $suburb, $street';
    } else {
      throw Exception('Failed to fetch address');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body: BlocBuilder<ShowSchedulingCubit, ShowSchedulingState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(0),
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
          child: state is ShowSchedulingSuccessState
              ? ListView.builder(
                  itemCount: state.showSchedulingModel.message!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => UpdateRequestByAdminCubit(
                                  getIt.get<UpdateRequestByAdminRepoImpl>()),
                              child: ProcessesOrdersBody(
                                data: state.showSchedulingModel.message![index],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width * 0.6,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.03,
                                  child: Icon(
                                    Icons.assignment_turned_in,
                                    color: Colors.blue,
                                    size: size.width * 0.03,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.005,
                                ),
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Row(
                                          children: [
                                            Text(
                                              state.showSchedulingModel
                                                      .message![index].number ??
                                                  "",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.phone,
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
                                        child: FutureBuilder(
                                          future: getReverseGeocoding(
                                              state.showSchedulingModel
                                                  .message![index].latitude!,
                                              state.showSchedulingModel
                                                  .message![index].longitude!),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Text(
                                                'Loading...',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              );
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                'Error: ${snapshot.error}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              );
                                            } else {
                                              return Row(
                                                children: [
                                                  Text(
                                                    '${snapshot.data}',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * 0.01,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const Icon(
                                                    Icons.location_pin,
                                                    color: Colors.blue,
                                                    size: 18.0,
                                                  )
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
                    );
                  },
                )
              : (state is ShowSchedulingFailureState)
                  ? CustomError(message: state.errorMessage)
                  : const CustomProgressIndicator(),
        );
      },
    ));
  }
}
