
import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/add_electrical/data/models/qr_code_model/qr_code_model.dart';
import 'package:dashboard/features/add_electrical/data/repos/add_electronic_device_repo.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AddElectronicDeviceRepoImpl implements AddElectronicDeviceRepo {
  final ApiService _apiService;

  AddElectronicDeviceRepoImpl(this._apiService);
  @override
  Future<Either<Failure, QrCodeModel>> addElectronicDevice(
      {required String endPoint,
      required String token,
      required String name,
      required int size,
      required String warning,
      required String notes,
      required String wayOfWork,
      required String warranteState,
      required String warantyDate,
      required XFile file,}) async {
    try {
      var data = await _apiService.postElectronicDevice(
          endPoint: endPoint,
          token: token,
          name: name,
          size: size,
          warning: warning,
          notes: notes,
          wayOfWork: wayOfWork,
          warranteState: warranteState,
          warantyDate: warantyDate, file: file);

      QrCodeModel qrCodeModel = QrCodeModel.fromJson(data);
     
      return right(qrCodeModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
