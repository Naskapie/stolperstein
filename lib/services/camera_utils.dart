import 'package:camera/camera.dart';

class CameraUtils {
  CameraUtils._internal();

  static List<CameraDescription> cameras;

  static Future<List<CameraDescription>> init() async {
    if (cameras == null) {
      cameras = await getAvailableCameras();
    }
    return cameras;
  }

  static Future<List<CameraDescription>> getAvailableCameras() =>
      availableCameras();
}
