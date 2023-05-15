import 'dart:io';

import 'package:flutter/material.dart';

class ShowImageWidget extends StatelessWidget {
  final String imageFile;
  final String imageUrl;
  const ShowImageWidget(
      {Key? key, required this.imageFile, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageFile != '') {
      return Image.file(
        File(imageFile),
        fit: BoxFit.cover,
      );
    } else if (imageUrl != '' && imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
      );
    } else {
      return const Icon(Icons.camera);
    }
  }
}
