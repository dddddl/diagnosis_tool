import 'package:diagnosis_tool/iot/blufi/blufi_activator.dart';
import 'package:diagnosis_tool/iot/blufi/blufi_activator_adapter.dart';
import 'package:diagnosis_tool/iot/core/ble/le_activator.dart';

import 'core/ble/ble_activator_adatper.dart';

abstract class Iot {
  static LeActivator getLeActivator() {
    return LeActivatorAdapter();
  }

  static BlufiActivator getBlufiActivator() {
    return BlufiActivatorAdapter();
  }
}
