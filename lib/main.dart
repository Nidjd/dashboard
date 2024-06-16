
import 'package:dashboard/core/utils/my_bloc_observer.dart';
import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/login_admin/presentation/views/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  Bloc.observer = MyBlocObserver();
 await initSharedPrefernce();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
