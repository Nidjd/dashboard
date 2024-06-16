import 'package:dartz/dartz.dart';

import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/show_teams/data/models/show_team_page_model/show_team_page_model.dart';
import 'package:dashboard/features/show_teams/data/repos/teams%20repos/show_teams_repo.dart';
import 'package:dio/dio.dart';

class ShowTeamsRepoImpl implements ShowTeamsRepo {
  final ApiService _apiService;

  ShowTeamsRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<ShowTeamPageModel>>> showTeams() async {
    try {
      final String token = prefs.getString('token')!;
      var data = await _apiService.getTeams(
          endPoint: "showTeam", token: "Bearer $token");
      List<ShowTeamPageModel> teams = [];

      for (var element in data) {
        teams.add(ShowTeamPageModel.fromJson(element));
      }
      return right(teams);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
