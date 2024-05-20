import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/login_admin/data/models/admin_inforation_login/admin_inforation_login.dart';
import 'package:dashboard/features/login_admin/data/repos/login_page_admin_repo.dart';
import 'package:dio/dio.dart';

class LoginPageAdminRepoImpl implements LoginPageAdminRepo {
  final ApiService _apiService;

  LoginPageAdminRepoImpl(this._apiService);
  @override
  Future<Either<Failure, AdminInforationLogin>> loginAdmin({
    required String email,
    required String password,
  }) async {
    try {
      
      var response = await _apiService.post(
          endPoint: "login", email: email, password: password);
      
      AdminInforationLogin adminInforationLogin =
          AdminInforationLogin.fromJson(response);
      
      return right(adminInforationLogin);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
