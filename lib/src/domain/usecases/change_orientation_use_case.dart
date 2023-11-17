import 'package:flutter/services.dart';

class ChangeOrientationUseCase {
  void call(List<DeviceOrientation> deviceOrientationList) {
    SystemChrome.setPreferredOrientations(deviceOrientationList);
  }
}
