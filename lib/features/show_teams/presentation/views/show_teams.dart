import 'package:flutter/material.dart';

import 'widgets/show_teams_body.dart';

class ShowTeam extends StatelessWidget {
  const ShowTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ShowTeamsBody(),
    );
  }
}