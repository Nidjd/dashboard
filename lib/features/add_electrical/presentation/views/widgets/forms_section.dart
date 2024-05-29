import 'package:dashboard/core/widgets/custom_text_form_field.dart';
import 'package:dashboard/features/add_electrical/presentation/manager/cubit/add_electronic_device_cubit.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/add_image_screen.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/number_picker.dart';
import 'package:dashboard/features/add_electrical/presentation/views/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormsSection extends StatelessWidget {
  const FormsSection({
    super.key,
    required TextEditingController nameController,
    required TextEditingController sizeController,
    required TextEditingController warningsController,
    required TextEditingController notesController,
    required TextEditingController howToUseController,
    required TextEditingController warrantyStatusController,
    required TextEditingController warrantyDurationController,
  })  : _nameController = nameController,
        _sizeController = sizeController,
        _warningsController = warningsController,
        _notesController = notesController,
        _howToUseController = howToUseController,
        _warrantyStatusController = warrantyStatusController,
        _warrantyDurationController = warrantyDurationController;

  final TextEditingController _nameController;
  final TextEditingController _sizeController;
  final TextEditingController _warningsController;
  final TextEditingController _notesController;
  final TextEditingController _howToUseController;
  final TextEditingController _warrantyStatusController;
  final TextEditingController _warrantyDurationController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AddElectronicDeviceCubit, AddElectronicDeviceState>(
        builder: (context, isSwitchOn) {
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormFiled(
              sizee: 0.4,
              controller: _nameController,
              label: 'اسم الجهاز',
              option: false,
            ),
            Container(
                width: size.width * 0.4,
                height: size.height * 0.25,
                child: AddImageScreen()),
            //  const SizedBox(height: 10),
            CustomTextFormFiled(
              sizee: 0.2,
              controller: _sizeController,
              label: 'حجم الجهاز',
            ),
            const SizedBox(height: 5),
            CustomTextFormFiled(
              sizee: 0.4,
              controller: _warningsController,
              label: 'تحذيرات الاستخدام',
            ),
            const SizedBox(height: 10),
            CustomTextFormFiled(
              sizee: 0.4,
              controller: _notesController,
              label: 'ملاحظات',
            ),
            const SizedBox(height: 10),
            CustomTextFormFiled(
              sizee: 0.4,
              controller: _howToUseController,
              label: 'طريقة العمل',
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.05,
                    child: Text(
                      "حالة الكفالة ",
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  SwitchButton(),
                  IntegerExample(),
                  // CustomTextFormFiled(
                  //   sizee: 0.2,
                  //   controller: _warrantyDurationController,
                  //   label: 'مدة الكفالة',
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      );
    });
  }
}
