import 'package:dashboard/features/show_teams/presentation/views/widgets/display_teams.dart';
import 'package:flutter/material.dart';

class ShowTeamsBody extends StatelessWidget {
  const ShowTeamsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: size.width,
                child: const Text(
                  "الفرق ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                )),
          ),
          DisplayTeams(),
        ])));
  }
}
