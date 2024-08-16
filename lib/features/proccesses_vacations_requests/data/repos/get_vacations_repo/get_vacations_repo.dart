import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/models/vacations_model/vacations_model.dart';

abstract class GetVacationsRepo
{
  Future<Either<Failure,List<VacationsModel>>> getVacations({required String token,required String endPoint});
}