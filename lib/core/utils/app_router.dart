import 'package:dashboard/features/add_electrical/presentation/views/widgets/qr_code_page.dart';
import 'package:dashboard/features/home_page/presentation/home_page.dart';
import 'package:dashboard/features/login_admin/presentation/views/login_page.dart';

import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLoginPage = '/';
  static const kHomePage = '/home-page';
  static const kShowAllTeams = '/show-all-teams';
  

  static final router = GoRouter(routes: [
    GoRoute(
      path: kLoginPage,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: kHomePage,
      builder: (context, state) => const HomePage(),
    ),
    
  ]);
}
