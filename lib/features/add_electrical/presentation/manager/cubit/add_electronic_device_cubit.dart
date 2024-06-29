



import 'package:bloc/bloc.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/add_electrical/data/models/qr_code_model/qr_code_model.dart';
import 'package:dashboard/features/add_electrical/data/repos/add_electronic_device_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'add_electronic_device_state.dart';

class AddElectronicDeviceCubit extends Cubit<AddElectronicDeviceState> {
  final AddElectronicDeviceRepo addElectronicDevice;
  AddElectronicDeviceCubit(this.addElectronicDevice)
      : super(AddElectronicDeviceInitial());

  Future<void> addNewElectronicDevice(
      {required String endPoint,
      required String token,
      required String name,
      required int size,
      required String warning,
      required String notes,
      required String wayOfWork,
      required String warranteState,
      required String warantyDate,required XFile file,}) async {
    emit(AddElectronicDeviceLoading());
    var result = await addElectronicDevice.addElectronicDevice(
        endPoint: endPoint,
        token: token,
        name: name,
        size: size,
        warning: warning,
        notes: notes,
        wayOfWork: wayOfWork,
        warranteState: warranteState,
        warantyDate: warantyDate, file: file,);
    
    result.fold(
      (Failure l) {
        emit(AddElectronicDeviceFailure(l.eerMessage));
      },
      (QrCodeModel r) => {emit(AddElectronicDeviceSuccess(r))},
    );
  }
}
