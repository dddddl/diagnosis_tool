
import 'package:diagnosis_tool/iot/callback/activator_callback.dart';
import 'package:diagnosis_tool/iot/entities/activator_info.dart';

abstract class BlufiActivator {

  void start(ActivatorInfo info, ActivatorCallback callback);

  void onStop();
}
