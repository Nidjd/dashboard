import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/models/leave_request_model/leave_request_model.dart';

abstract class LeaveRequestRepo
{
  Future<Either<Failure,LeaveRequestModel>> leaveRequest({required String token,required String endPoint,required int id,required String status,});
}