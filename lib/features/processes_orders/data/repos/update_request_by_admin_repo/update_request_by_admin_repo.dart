import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/processes_orders/data/models/update_request_by_admin_model/update_request_by_admin_model.dart';

abstract class UpdateRequestByAdminRepo {
  Future<Either<Failure, UpdateRequestByAdminModel>> updateRequestByAdmin({required String token,required String endPoint,required int id, required double salary,required String warrantyState});
}
