import 'package:diagnosis_tool/iot/entities/activator_info.dart';
import 'package:diagnosis_tool/iot/entities/iot_device.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class LeActivatorInfo {
  ActivatorInfo? info;

  ScanResult scanResult;

  LeActivatorInfo(this.info, this.scanResult);
}
