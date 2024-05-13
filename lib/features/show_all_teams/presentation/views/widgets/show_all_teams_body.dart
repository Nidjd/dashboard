
import 'package:dashboard/features/show_all_teams/presentation/views/widgets/team_item.dart';
import 'package:flutter/material.dart';

class ShowAllTeamsBody extends StatelessWidget {
  const ShowAllTeamsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) => const TeamIteam(),
          itemCount: 10,
        ),
      ),
    );
  }
}
