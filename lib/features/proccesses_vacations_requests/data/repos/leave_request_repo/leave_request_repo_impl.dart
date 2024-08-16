import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/models/leave_request_model/leave_request_model.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/repos/leave_request_repo/leave_request_repo.dart';
import 'package:dio/dio.dart';

class LeaveRequestRepoImpl implements LeaveRequestRepo {
  final ApiService _apiService;

  LeaveRequestRepoImpl(this._apiService);
  @override
  Future<Either<Failure, LeaveRequestModel>> leaveRequest(
      {required String token,
      required String endPoint,
      required String status,
      required int id,}) async {
    try {
      var data = await _apiService.leaveRequest(
        token: token,
        endPoint: endPoint,
        id: id,
        status: status,
      );
      LeaveRequestModel leaveRequestModel = LeaveRequestModel.fromJson(data);
      return right(leaveRequestModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
