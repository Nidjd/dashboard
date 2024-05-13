import 'package:dashboard/core/utils/app_router.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/views/add_maintenance_worker.dart';
import 'package:dashboard/features/home_page/presentation/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
