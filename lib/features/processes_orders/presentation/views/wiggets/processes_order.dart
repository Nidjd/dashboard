import 'package:dashboard/features/add_electrical/presentation/views/add_electrical.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/add_elctronic_device_body.dart';
import 'package:dashboard/features/processes_orders/presentation/views/wiggets/processes_orders_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProcessesOrder extends StatelessWidget {
  const ProcessesOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Expanded(child: ProcessesOrdersBody()),
      ),
    );
  }
}
