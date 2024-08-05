import 'package:flutter/material.dart';

import 'widgets/scheduling_orders_body.dart';

class SchedulingOrdersPage extends StatelessWidget {
  const SchedulingOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      child: const SchedulingOrdersBody(),
      textDirection: TextDirection.rtl,
    );
  }
}
