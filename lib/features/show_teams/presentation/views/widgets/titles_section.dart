
import 'package:flutter/material.dart';

class TitlesSection extends StatelessWidget {
  const TitlesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "اسم الفريق ",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "عنوان الفريق",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "عدد اعضاء الفريق ",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          height: 20,
          thickness: 2,
          indent: 0,
          endIndent: 0,
        ),
      ],
    );
  }
}
