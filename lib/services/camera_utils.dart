import 'package:camera/camera.dart';

class CameraUtils {
  static Future<CameraDescription> getCamera() async {
    final cameras = await availableCameras();
    final CameraDescription firstCamera = cameras.first;

    return firstCamera;
  }
}
