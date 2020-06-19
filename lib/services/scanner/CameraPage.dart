import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class CameraPageTest extends StatefulWidget {
  @override
  CameraPageTestState createState() => CameraPageTestState();
}

class CameraPageTestState extends State<CameraPageTest> {
  File _pickedImage;
  bool _isImageLoaded = false;
  bool _isTextLoaded = false;
  String _text = '';

  Future pickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _pickedImage = tempStore;
      _isImageLoaded = true;
    });
  }

  Future readText() async {
    var visionImage = FirebaseVisionImage.fromFile(_pickedImage);
    var textRecognizer = FirebaseVision.instance.textRecognizer();
    var visionText = await textRecognizer.processImage(visionImage);

    setState(
      () {
        _text = visionText.text;
        _isTextLoaded = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Column(
        children: <Widget>[
          _isImageLoaded
              ? Center(
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(_pickedImage), fit: BoxFit.cover)),
                  ),
                )
              : Container(),
          _isTextLoaded ? Center(child: Text(_text)) : Container(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Choose an image'),
            onPressed: pickImage,
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Read Text'),
            onPressed: readText,
          ),
        ],
      ),
    );
  }
}
