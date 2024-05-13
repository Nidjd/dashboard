import 'package:dashboard/features/home_page/presentation/home_page.dart';
import 'package:dashboard/features/show_all_teams/presentation/views/show_all_teams.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
    static const kHomePage = '/';
  static const kShowAllTeams = '/show-all-teams';

  static final router = GoRouter(routes: [
    GoRoute(
      path: kHomePage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: kShowAllTeams,
      builder: (context, state) => const ShowAllTeams(),
    ),
    
  ]);
}
