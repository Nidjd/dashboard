import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key, required this.data});
  final String data;

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {

   @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Image.memory(base64.decode(widget.data))
        ),
      ),
    );
  }
}
