abstract class CmdConfig {
  static const int report = 1;
  static const int report_reply = 2;
  static const int control = 3;
  static const int control_reply = 4;
  static const int get_status = 5;
  static const int get_status_reply = 6;
  static const int event_post = 7;
  static const int event_reply = 8;
  static const int action = 9;
  static const int action_reply = 10;
  static const int unbind_device = 11;
}

abstract class ControlConfig {
  static const int mapping = 0;
  static const int mowing = 1;
  static const int returning = 2;
  static const int paused = 3;
}
