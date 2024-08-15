import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/processes_orders/data/models/update_request_by_admin_model/update_request_by_admin_model.dart';
import 'package:dashboard/features/processes_orders/data/repos/update_request_by_admin_repo/update_request_by_admin_repo.dart';
import 'package:dio/dio.dart';

class UpdateRequestByAdminRepoImpl implements UpdateRequestByAdminRepo {
  final ApiService _apiService;

  UpdateRequestByAdminRepoImpl(this._apiService);
  @override
  Future<Either<Failure, UpdateRequestByAdminModel>> updateRequestByAdmin(
      {required String token,
      required String endPoint,
      required int id,
      required double salary,
      required String warrantyState}) async {
    try {
      var data = await _apiService.updateRequestByAdmin(
        endPoint: endPoint,
        token: token,
        salary: salary,
        id: id,
        warrantyState:warrantyState
      );
      UpdateRequestByAdminModel updateRequestByAdminModel =
          UpdateRequestByAdminModel.fromJson(data);
      return right(updateRequestByAdminModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
