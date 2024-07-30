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
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, top: 4.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  "اسم الفريق ",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Center(
                  child: Text(
                    "عنوان الفريق",
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.1),
                  child: Text(
                    "عدد اعضاء الفريق ",
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.bold),
                  ),
                ),
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
