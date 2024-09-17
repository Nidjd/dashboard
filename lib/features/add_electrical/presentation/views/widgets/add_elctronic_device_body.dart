import 'dart:typed_data';

import 'package:dashboard/core/utils/custom_alert_dialog.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/features/add_electrical/presentation/manager/cubit/add_electronic_device_cubit.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/forms_section.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/qr_code_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? image;
  Uint8List? imageBytes;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      final Uint8List bytes = await selectedImage.readAsBytes();
      setState(() {
        image = selectedImage;
        imageBytes = bytes;
      });
    }
  }

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
            builder: (context) => SizedBox(
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
          return Padding(
            padding: const EdgeInsets.only(right: 2.0, left: 2.0),
            child: Container(
              width: size.width * 0.59,
              height: size.height * 1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: size.width * 0.6,
                        child: const Text(
                          "جهاز جديد",
                          style: TextStyle(
                              color: Colors.black,
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
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.25,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: _pickImage,
                              child: Center(
                                  child: DottedBorder(
                                color: Colors.blue,
                                strokeWidth: 2,
                                child: Container(
                                  width: 100,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.blue,
                                    size: 50.0,
                                  ),
                                ),
                              )),
                            ),
                            const SizedBox(width: 40),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: imageBytes == null
                                  ? const Text(
                                      "No Image Selected",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  : Container(
                                      width: 100,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        border: Border.all(
                                          color: Colors.blue,
                                          width: 2.0,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      child: Image.memory(
                                        imageBytes!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      FormsSection(
                        nameController: _nameController,
                        sizeController: _sizeController,
                        warningsController: _warningsController,
                        notesController: _notesController,
                        howToUseController: _howToUseController,
                        warrantyStatusController: _warrantyStatusController,
                        warrantyDurationController: _warrantyDurationController,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 9.0),
                        height: size.height * 0.08,
                        width: size.width * 0.15,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_sizeController.text.isEmpty) {
                                showCustomAlertDialog(
                                  context,
                                  "Error",
                                  "The size must be an integer",
                                );
                              } else {
                                if (image != null) {
                                  String token = prefs.getString('token')!;
                                  await BlocProvider.of<
                                          AddElectronicDeviceCubit>(context)
                                      .addNewElectronicDevice(
                                    endPoint: "addelectrical",
                                    token: token,
                                    name: _nameController.text,
                                    size: int.parse(_sizeController.text),
                                    warning: _warningsController.text,
                                    notes: _notesController.text,
                                    wayOfWork: _howToUseController.text,
                                    warranteState:
                                        _warrantyStatusController.text,
                                    warantyDate:
                                        _warrantyDurationController.text,
                                    file: image!,
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => const SizedBox(
                                        width: 300,
                                        height: 150,
                                        child: Center(
                                            child:
                                                Text("قم بتحميل صورة للجهاز"))),
                                  );
                                }
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            backgroundColor: Colors.blue,
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
