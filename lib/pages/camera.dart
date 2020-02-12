import 'package:Stolperstein/services/camera_utils.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController _controller;

  @override
  void initState() {
    super.initState();
    CameraUtils.init().then((cameras) {
      _controller = CameraController(cameras.first, ResolutionPreset.medium);
      _controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _controller.value.isInitialized
              ? Transform.scale(
                  scale: _controller.value.aspectRatio / deviceRatio,
                  child: Center(
                    child: AspectRatio(
                      child: CameraPreview(_controller),
                      aspectRatio: _controller.value.aspectRatio,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );

    floatingActionButton:
    FloatingActionButton(onPressed: () {});
  }
}
