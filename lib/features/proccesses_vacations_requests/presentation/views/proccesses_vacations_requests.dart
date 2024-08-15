import 'package:dashboard/features/proccesses_vacations_requests/presentation/views/widgets/proccesses_vacations_requests_body.dart';
import 'package:flutter/material.dart';

class ProccessesVacationsRequests extends StatelessWidget {
  const ProccessesVacationsRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          //  mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.,
          children: [
            Expanded(
              child: ProccessesVacationsRequestsBody(),
            ),
            Container(
              width: size.width * 0.3,
            )
          ],
        ),
      ),
    );
  }
}
