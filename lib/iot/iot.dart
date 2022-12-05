import 'package:diagnosis_tool/iot/core/ble/le_activator.dart';

import 'core/ble/BleActivatorImpl.dart';

abstract class Iot {
  LeActivator getLeActivator() {
    return BleActivatorImpl();
  }
}
