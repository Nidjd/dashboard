import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/login_admin/data/models/admin_inforation_login/admin_inforation_login.dart';

abstract class LoginPageAdminRepo {
  Future<Either<Failure, AdminInforationLogin>> loginAdmin({
    required String email,
    required String password,
  });
}
