import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShowDatepicker extends StatefulWidget {
  int numm;
  ShowDatepicker({
    super.key,
    required this.numm,
  });

  @override
  State<ShowDatepicker> createState() => _ShowDatepickerState();
}

class _ShowDatepickerState extends State<ShowDatepicker> {
  DateTime _startDate1 = DateTime.now();
  DateTime _endDate1 = DateTime.now().add(const Duration(days: 7));
  DateTime _startDate2 = DateTime.now();
  DateTime _endDate2 = DateTime.now().add(const Duration(days: 7));

  Future<void> _selectStartDate(BuildContext context) async {
    if (widget.numm == 1) {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _startDate1,
        firstDate: DateTime(DateTime.now().year, 1, 1),
        lastDate: DateTime(DateTime.now().year, 12, 31),
      );
      if (picked != null && picked != _startDate1) {
        setState(() {
          _startDate1 = picked;
        });
      }
    } else if (widget.numm == 2) {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _startDate2,
        firstDate: DateTime(
          DateTime.now().year,
          1,
        ),
        lastDate: DateTime(
          DateTime.now().year,
          12,
        ),
        initialDatePickerMode: DatePickerMode.year,
      );
      if (picked != null && picked != _startDate2) {
        String selectedDate =
            '${picked.year}-${picked.month.toString().padLeft(2, '0')}';

        setState(() {
          _startDate2 = picked;
        });
      }
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    if (widget.numm == 1) {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _endDate1,
        firstDate: DateTime(DateTime.now().year, 1, 1),
        lastDate: DateTime(DateTime.now().year, 12, 31),
      );
      if (picked != null && picked != _endDate1) {
        setState(() {
          _endDate1 = picked;
        });
      }
    } else if (widget.numm == 2) {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _endDate2,
        firstDate: DateTime(
          DateTime.now().year,
          1,
        ),
        lastDate: DateTime(
          DateTime.now().year,
          12,
        ),
        initialDatePickerMode: DatePickerMode.year,
      );
      if (picked != null && picked != _endDate2) {
        setState(() {
          _endDate2 = picked;
        });
      }
    }
    print("========================");
    print(
        "${_startDate1.year} +${_startDate1.month}+ ${_startDate1.day}+ ${_endDate1.year} +${_endDate1.month}+ ${_endDate1.day}");
    print(
        "${_startDate2.year} +${_startDate2.month}+ ${_endDate2.year} +${_endDate2.month}");
    print("========================");
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _selectStartDate(context),
              child: Text(
                  widget.numm == 1 ? 'اختر تاريخ البداية' : "اختر الشهر الأول"),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            Text(
                'تاريخ البداية: ${widget.numm == 1 ? _startDate1.toLocal().toString().split(' ')[0] : '${_startDate2.year}-${_startDate2.month}'}'),
            SizedBox(width: 60.0),
            ElevatedButton(
              onPressed: () => _selectEndDate(context),
              child: Text(widget.numm == 1
                  ? 'اختر تاريخ النهاية'
                  : " اختر الشهر الثاني"),
            ),
            SizedBox(width: 10.0),
            Text(
                'تاريخ النهاية: ${widget.numm == 1 ? _endDate1.toLocal().toString().split(' ')[0] : '${_endDate2.year}-${_endDate2.month}'}'),
          ],
        ),
      ),
    );
  }
}
