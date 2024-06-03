import 'package:dashboard/features/show_teams/presentation/views/widgets/show_users_body.dart';
import 'package:flutter/material.dart';

class ShowUsers extends StatelessWidget {
  const ShowUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ShowUsersBody(),
    );
  }
}