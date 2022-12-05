import 'package:diagnosis_tool/iot/activator.dart';
import 'package:diagnosis_tool/iot/core/mixin_activator_info.dart';
import 'package:diagnosis_tool/iot/entities/activator_info.dart';

import '../../callback/activator_callback.dart';

class BleActivator with MixinActivatorInfo implements Activator {
  ActivatorInfo? _activatorInfo;
  ActivatorCallback? _callback;

  BleActivator(ActivatorInfo info) {
    _activatorInfo = info;
    _callback = info.callback;
    convert(info);
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void stop() {
    // TODO: implement stop
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }
}
