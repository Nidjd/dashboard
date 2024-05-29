import 'package:dashboard/core/utils/custom_alert_dialog.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';

import 'package:dashboard/features/add_electrical/presentation/manager/cubit/add_electronic_device_cubit.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/forms_section.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/qr_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddElectricalBody extends StatefulWidget {
  const AddElectricalBody({super.key});

  @override
  State<AddElectricalBody> createState() => _DeviceFormState();
}

class _DeviceFormState extends State<AddElectricalBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _warningsController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _howToUseController = TextEditingController();
  final TextEditingController _warrantyStatusController =
      TextEditingController();
  final TextEditingController _warrantyDurationController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sizeController.dispose();
    _warningsController.dispose();
    _notesController.dispose();
    _howToUseController.dispose();
    _warrantyStatusController.dispose();
    _warrantyDurationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<AddElectronicDeviceCubit, AddElectronicDeviceState>(
      listener: (context, state) {
        if (state is AddElectronicDeviceSuccess) {
          showDialog(
            context: context,
            builder: (context) => Container(
              width: 2,
              child: QrCodePage(
                data: state.qrCodeModel.qrCode!.qrBase64!,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AddElectronicDeviceLoading) {
          return const CustomProgressIndicator();
        } else if (state is AddElectronicDeviceFailure) {
          return CustomError(message: state.errMessage);
        } else {
          return
              // Scaffold(
              //   // appBar: AppBar(
              //   //   title: const Text('إضافة جهاز إلكتروني'),
              //   //   backgroundColor: Colors.teal,
              //   // ),
              //   body:
              //   Padding(
              // padding: const EdgeInsets.all(16.0),
              // child:

              Padding(
            padding: const EdgeInsets.only(right: 2.0, left: 2.0),
            child: Container(
              width: size.width * 0.59, // Set the desired width of the box
              height: size.height * 1, // Set the desired height of the box
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color
                borderRadius:
                    BorderRadius.circular(2.0), // Apply rounded corners
                border: Border.all(
                  color: Colors.grey, // Set the color of the border
                  width: 2.0, // Set the thickness of the border
                ),
              ),

              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: size.width * 0.6,
                        child: Text(
                          //textDirection: TextDirection.ltr,

                          "جهاز جديد",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      FormsSection(
                          nameController: _nameController,
                          sizeController: _sizeController,
                          warningsController: _warningsController,
                          notesController: _notesController,
                          howToUseController: _howToUseController,
                          warrantyStatusController: _warrantyStatusController,
                          warrantyDurationController:
                              _warrantyDurationController),
                      Container(
                        padding: EdgeInsets.only(right: 9.0),
                        height: size.height * 0.08,
                        width: size.width * 0.15,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_sizeController is String) {
                                showCustomAlertDialog(
                                  context,
                                  "!!!",
                                  "the size must be integer",
                                );
                              } else {
                                String token = prefs.getString('token')!;
                                await BlocProvider.of<AddElectronicDeviceCubit>(
                                        context)
                                    .addNewElectronicDevice(
                                  endPoint: "addelectrical",
                                  token: token,
                                  name: _nameController.text,
                                  size: int.parse(_sizeController.text),
                                  warning: _warningsController.text,
                                  notes: _notesController.text,
                                  wayOfWork: _howToUseController.text,
                                  warranteState: _warrantyStatusController.text,
                                  warantyDate: _warrantyDurationController.text,
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            backgroundColor: Colors.blue,
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 50, vertical: 15),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          child: const Text('إضافة الجهاز',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
