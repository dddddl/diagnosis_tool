import 'package:diagnosis_tool/iot/utils/short_uuid.dart';


class Command<T>  {
  int cmd = 3;
  String uuid = ShortUuid.generateShortUuid();
  int timeStamps = DateTime.now().millisecondsSinceEpoch;
  T params;

  Command(this.params);


}

class Control extends Command<ControlParams> {
  Control(super.params);
}

class ControlParams {
  int status;
  int velocity;

  ControlParams(this.status, this.velocity);
}
