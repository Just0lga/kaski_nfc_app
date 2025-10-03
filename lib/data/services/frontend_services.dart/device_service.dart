import 'package:device_info_plus/device_info_plus.dart';

class DeviceService {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Android: Marka + Model
  static Future<String> getDeviceModel() async {
    final androidInfo = await _deviceInfo.androidInfo;
    final brand = androidInfo.manufacturer; // Örn: "Samsung"
    final model = androidInfo.model ?? "Bilinmiyor"; // Örn: "SM-G991B"
    return "$brand $model";
  }

  /// Android: Device ID
  static Future<String> getDeviceId() async {
    final androidInfo = await _deviceInfo.androidInfo;
    return androidInfo.id; // Örn: "RQ123456789"
  }

  /// Android: Marka + Model + ID
  static Future<Map<String, String>> getDeviceData() async {
    final androidInfo = await _deviceInfo.androidInfo;
    return {
      "model": "${androidInfo.manufacturer} ${androidInfo.model}",
      "deviceId": androidInfo.id,
    };
  }
}
