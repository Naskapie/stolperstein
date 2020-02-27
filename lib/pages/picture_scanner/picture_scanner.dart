import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'detector_painters.dart';

class PictureScanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PictureScannerState();
}

class _PictureScannerState extends State<PictureScanner> {
  File _imageFile;
  Size _imageSize;
  dynamic _scanResults;
  final TextRecognizer _recognizer = FirebaseVision.instance.textRecognizer();

  Future<void> _getAndScanImage() async {
    setState(() {
      _imageFile = null;
      _imageSize = null;
    });

    final File imageFile =
        await ImagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      _getImageSize(imageFile);
      _scanImage(imageFile);
    }

    setState(() {
      _imageFile = imageFile;
    });
  }

  Future<void> _getImageSize(File imageFile) async {
    final Completer<Size> completer = Completer<Size>();

    final Image image = Image.file(imageFile);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );

    final Size imageSize = await completer.future;
    setState(() {
      _imageSize = imageSize;
    });
  }

  Future<void> _scanImage(File imageFile) async {
    setState(() {
      _scanResults = null;
    });

    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(imageFile);

    dynamic results;
    results = await _recognizer.processImage(visionImage);

    setState(() {
      _scanResults = results;
      print('_scanResults ${_scanResults.toString()}');
    });
  }

  CustomPaint _buildResults(Size imageSize, dynamic results) {
    CustomPainter painter;

    painter = TextDetectorPainter(_imageSize, results);

    return CustomPaint(
      painter: painter,
    );
  }

  Widget _buildImage() {
    return Expanded(
      flex: 2,
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.file(_imageFile).image,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: _imageSize == null || _scanResults == null
            ? const Center(
                child: Text(
                  'Scanning...',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30.0,
                  ),
                ),
              )
            : _buildResults(_imageSize, _scanResults),
      ),
    );
  }

  Widget _buildTextList() {
    return Expanded(
      flex: 1,
      child: Container(
        child: _scanResults == null
            ? const Center(
                child: Text(
                  'No text detected',
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(1.0),
                itemCount: _scanResults.length,
                itemBuilder: (context, i) {
                  return _buildTextRow(_scanResults[i].text);
                },
              ),
      ),
    );
  }

  Widget _buildTextRow(text) {
    return ListTile(
      title: Text(
        '$text',
      ),
      dense: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Scanner'),
      ),
      body: Column(
        children: <Widget>[
          _imageFile == null
              ? const Center(child: Text('No image selected.'))
              : _buildImage(),
          _scanResults == null
              ? const Center(child: Text('No text to show.'))
              : _buildTextList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getAndScanImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  @override
  void dispose() {
    _recognizer.close();
    super.dispose();
  }
}
