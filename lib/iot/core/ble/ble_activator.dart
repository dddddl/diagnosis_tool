import 'package:diagnosis_tool/iot/activator.dart';
import 'package:diagnosis_tool/iot/core/mixin_activator_info.dart';
import 'package:diagnosis_tool/iot/entities/activator_info.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../callback/activator_callback.dart';
import '../../entities/ble_config.dart';
import '../../entities/le_activator_info.dart';
import 'le_transport_impl.dart';

class BleActivator
    with MixinActivatorInfo, MixinLeTransportImpl
    implements Activator {
  LeActivatorInfo? _activatorInfo;
  ActivatorCallback? _callback;

  int _status = 0;

  BleActivator(LeActivatorInfo info, ActivatorCallback callback) {
    _activatorInfo = info;
    _callback = callback;
    convert(info.info!);
  }

  /// 连接设备
  @override
  void start() async {
    connect(_activatorInfo!.scanResult, _activatorInfo?.info?.timeout ?? 90);
  }

  @override
  void stop() {
    print("stop   ");
    release(_activatorInfo?.scanResult);
  }
}
