import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/features/add_electrical/data/repos/add_electronic_device_repo_impl.dart';
import 'package:dashboard/features/add_electrical/presentation/manager/cubit/add_electronic_device_cubit.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/add_elctronic_device_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddElectrical extends StatelessWidget {
  const AddElectrical({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            AddElectronicDeviceCubit(getIt.get<AddElectronicDeviceRepoImpl>()),
        child: const AddElectricalBody(),
      ),
    );
  }
}
