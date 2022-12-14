import 'package:diagnosis_tool/iot/core/ble/le_activator.dart';
import 'package:diagnosis_tool/iot/entities/activator_info.dart';
import 'package:diagnosis_tool/iot/entities/le_activator_info.dart';

import '../../activator.dart';
import '../../callback/activator_callback.dart';
import 'ble_activator.dart';

class LeActivatorAdapter implements LeActivator {
  BleActivator? _bleActivator;

  @override
  void onStop() {
    _bleActivator?.stop();
    _bleActivator = null;
  }

  @override
  void start(LeActivatorInfo info, ActivatorCallback callback) {
    _bleActivator ??= BleActivator(info, callback);
    _bleActivator?.start();
  }

}
