import 'package:dashboard/features/home_page/presentation/views/widgets/home_page_body.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageBody(),
    );
  }
}
