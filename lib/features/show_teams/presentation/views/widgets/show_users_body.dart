import 'package:dashboard/features/show_teams/presentation/views/widgets/display_teams.dart';
import 'package:dashboard/features/show_teams/presentation/views/widgets/display_users.dart';
import 'package:flutter/material.dart';

class ShowUsersBody extends StatelessWidget {
  const ShowUsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                    width: size.width,
                    child: const Text(
                      "أعضاء الفريق ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
              ),
              displayUsers(),
            ]),
          ),
        )));
  }
}
