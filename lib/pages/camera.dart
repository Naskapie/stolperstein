import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    Key key,
    @required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  // final CameraPage args = ModalRoute.of(context).settings.arguments;
  CameraController _controller;
  // Future operations take time to perform and return the result later
  // Return Values of the Future(potential value) cannot be used
  Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();

    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    print('CAMERA PRINT ${widget.camera}');
    print('CAMERA PRINT $_controller}');

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
    print('DISPOSE PRINT $_controller');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Future Builder lets program continue other operation
      //  while current operations is being performed.
      // its calles the the future function to wait for the result

      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        // The Builder function uses the context object of the
        // widget that the Builder widget is in.
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          // builder Snapshot has three states (none/waiting/done)
          if (snapshot.connectionState == ConnectionState.done) {
            print('IF PRINT $_controller ${ConnectionState.done}');
            print('IF PRINT $_controller');
            // If the Future is complete, display the review
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Construct the path where the image should be saved using the
            // pattern package.
            final String path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await _controller.takePicture(path);

            // If the picture was taken, display it on a new screen.
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DisplayPictureScreen(imagePath: path),
            //   ),
            // );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}