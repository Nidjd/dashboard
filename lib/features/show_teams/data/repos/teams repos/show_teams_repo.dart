import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/show_teams/data/models/show_team_page_model/show_team_page_model.dart';

abstract class ShowTeamsRepo {
  Future<Either<Failure, List<ShowTeamPageModel>>> showTeams();
}
