import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stratosfy_esp_ble_provisioning/esp_bluetooth_provisioning.dart';

final scanProvider = StateNotifierProvider((ref) => ScanStateNotifier());

class ScanStateNotifier extends StateNotifier {
  ScanStateNotifier() : super(null);

  // 申请蓝牙权限
  // You can request multiple permissions at once.
  Future<bool> requestPermissions() async {
    // 如果是Android平台
    if (Platform.isAndroid) {
      return await _requestAndroidPermissions();
    } else if (Platform.isIOS) {
      return await _requestIOSPermissions();
    }
    return false;
  }

  // 申请Android蓝牙权限
  Future<bool> _requestAndroidPermissions() async {
    // 如果sdk版本大于等于29
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var status;
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt >= 31) {
        status = await [
          Permission.bluetoothConnect,
          Permission.bluetoothScan,
        ].request();
      } else {
        status = await [
          Permission.locationWhenInUse,
          Permission.bluetooth,
          Permission.bluetoothConnect,
          Permission.bluetoothScan,
          Permission.bluetoothAdvertise,
        ].request();
      }
    }
    return status.isGranted;
  }

  // 申请iOS蓝牙权限
  Future<bool> _requestIOSPermissions() async {
    var status = Permission.bluetooth.request();
    return status.isGranted;
  }

  void scan() {}
}
