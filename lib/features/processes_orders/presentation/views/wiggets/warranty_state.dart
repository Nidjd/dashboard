import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WarrantyState extends StatefulWidget {
  const WarrantyState(
      {super.key,
      required this.icon,
      required this.text,
      required this.isWarranted});
  final IconData icon;
  final String text;
  final bool isWarranted;

  @override
  State<WarrantyState> createState() =>
      _WarrantyStateState(icon, text, isWarranted);
}

class _WarrantyStateState extends State<WarrantyState> {
  final IconData icon;
  final String text;
  bool isWarranted;

  _WarrantyStateState(
    this.icon,
    this.text,
    this.isWarranted,
  );
  @override
  Widget build(BuildContext context) {
    bool _isSelected = false;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (text == "مكفول" && isWarranted == false) isWarranted = true;
          if (text == "غير مكفول" && isWarranted == true) isWarranted = false;
          print(text);
          print(isWarranted);
        });
       
      },
      child: Container(
        width: size.width * 0.06,
        height: size.height * 0.1,
        // child: ,
        decoration: BoxDecoration(
          color: isWarranted ? Colors.green : Colors.red,
          border: Border.all(
            // Add the border
            color: Colors.grey, // Set the color of the border
            width: 2.0, // Set the thickness of the border
          ),
        ),
        child: Column(
          children: [
            // Text("hh"),
            IconButton(
              icon: Icon(icon),
              onPressed: () => setState(() {}),
            ),
            Text(
              text,
            )
          ],
        ),
      ),
    );
  }
}
