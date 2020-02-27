import 'package:camera/camera.dart';

class CameraUtils {
  static Future<CameraDescription> getCamera() async {
    final List<CameraDescription> cameras = await availableCameras();
    final CameraDescription firstCamera = cameras.first;

    return firstCamera;
  }
}
