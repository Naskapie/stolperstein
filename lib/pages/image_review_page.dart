// A widget that displays the picture taken by the user.
import 'dart:io';

import 'package:flutter/material.dart';

class ImageReviewPage extends StatelessWidget {
  const ImageReviewPage({Key key, this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
