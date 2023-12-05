import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

Future<String> convertImageToBase64(File imageFile) async {
  List<int> imageBytes = await imageFile.readAsBytes();
  String base64Image = base64Encode(imageBytes);
  return base64Image;
}


class ConvertImage extends StatefulWidget {
  const ConvertImage({Key? key}) : super(key: key);

  @override
  State<ConvertImage> createState() => _ConvertImageState();
}

class _ConvertImageState extends State<ConvertImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          Text('data')
        ],
      ),
    );
  }
}



