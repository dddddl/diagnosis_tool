import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

part 'prepare_provider.freezed.dart';

part 'prepare_provider.g.dart';

@freezed
class PrepareState with _$PrepareState {
  const factory PrepareState({
    required bool checked,
    required bool permissionGranted,
  }) = _PrepareState;

  factory PrepareState.fromJson(Map<String, dynamic> json) =>
      _$PrepareStateFromJson(json);
}

final prepareProvider =
    StateNotifierProvider.autoDispose<PrepareStateNotifier, PrepareState>(
        (ref) => PrepareStateNotifier());

class PrepareStateNotifier extends StateNotifier<PrepareState> {
  PrepareStateNotifier()
      : super(const PrepareState(checked: false, permissionGranted: false));

  Future<bool> isPermissionGranted() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      var androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt >= 31) {
        if (await Permission.bluetoothConnect.status.isGranted &&
            await Permission.bluetoothScan.status.isGranted) {
          return true;
        } else {
          return false;
        }
      } else {
        if (await Permission.locationWhenInUse.status.isGranted &&
            await Permission.bluetoothAdvertise.status.isGranted &&
            await Permission.bluetoothScan.status.isGranted &&
            await Permission.bluetooth.status.isGranted &&
            await Permission.bluetoothConnect.status.isGranted) {
          return true;
        } else {
          return false;
        }
      }
    } else if (Platform.isIOS) {
      final status = await Permission.locationWhenInUse.status;
      return status.isGranted;
    } else {
      return false;
    }
  }

  // 申请蓝牙权限
  // You can request multiple permissions at once.
  void requestPermissions() async {
    // 如果是Android平台
    var granted = false;
    if (Platform.isAndroid) {
      granted = await _requestAndroidPermissions();
    } else if (Platform.isIOS) {
      granted = await _requestIOSPermissions();
    }

    state = state.copyWith(permissionGranted: granted);
  }

  // 申请Android蓝牙权限
  Future<bool> _requestAndroidPermissions() async {
    // 如果sdk版本大于等于29
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    Map<Permission, PermissionStatus> status;
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
    return status.values.every((element) => element.isGranted);
  }

  // 申请iOS蓝牙权限
  Future<bool> _requestIOSPermissions() async {
    var status = Permission.bluetooth.request();
    return status.isGranted;
  }

  void updateChecked(bool checked) {
    state = state.copyWith(checked: checked);
  }
}
