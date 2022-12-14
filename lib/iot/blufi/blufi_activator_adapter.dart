import 'package:diagnosis_tool/iot/activator.dart';
import 'package:diagnosis_tool/iot/blufi/blufi_activator.dart';
import 'package:diagnosis_tool/iot/blufi/blufi_activator_impl.dart';
import 'package:diagnosis_tool/iot/callback/activator_callback.dart';
import 'package:diagnosis_tool/iot/entities/activator_info.dart';

class BlufiActivatorAdapter implements BlufiActivator {
  Activator? _activator;

  @override
  void onStop() {
    _activator?.stop();
    _activator = null;
  }

  @override
  void start(ActivatorInfo info, ActivatorCallback callback) {
    _activator ??= BlufiActivatorImpl(info, callback);
    _activator?.start();
  }
}
