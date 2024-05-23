
import 'package:dashboard/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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
  }) : _nameController = nameController, _sizeController = sizeController, _warningsController = warningsController, _notesController = notesController, _howToUseController = howToUseController, _warrantyStatusController = warrantyStatusController, _warrantyDurationController = warrantyDurationController;

  final TextEditingController _nameController;
  final TextEditingController _sizeController;
  final TextEditingController _warningsController;
  final TextEditingController _notesController;
  final TextEditingController _howToUseController;
  final TextEditingController _warrantyStatusController;
  final TextEditingController _warrantyDurationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiled(
          controller: _nameController,
          label: 'اسم الجهاز',
        ),
        const SizedBox(height: 10),
        CustomTextFormFiled(
          controller: _sizeController,
          label: 'حجم الجهاز',
        ),
        const SizedBox(height: 10),
        CustomTextFormFiled(
          controller: _warningsController,
          label: 'تحذيرات الاستخدام',
        ),
        const SizedBox(height: 10),
        CustomTextFormFiled(
          controller: _notesController,
          label: 'ملاحظات',
        ),
        const SizedBox(height: 10),
        CustomTextFormFiled(
          controller: _howToUseController,
          label: 'طريقة العمل',
        ),
        const SizedBox(height: 10),
        CustomTextFormFiled(
          controller: _warrantyStatusController,
          label: 'حالة الكفالة',
        ),
        const SizedBox(height: 10),
        CustomTextFormFiled(
          controller: _warrantyDurationController,
          label: 'مدة الكفالة',
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
