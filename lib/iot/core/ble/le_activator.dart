import '../../callback/activator_callback.dart';
import '../../entities/activator_info.dart';
import '../../entities/le_activator_info.dart';

abstract class LeActivator {

  void start(LeActivatorInfo info, ActivatorCallback callback);

  void onStop();
}
