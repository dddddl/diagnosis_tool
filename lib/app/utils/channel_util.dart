import 'package:diagnosis_tool/iot/utils/log_utils.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class ChannelUtil {
  static final Map<String, String> _specialSignal = {
    "CA": "1,11",
    "CO": "1,11",
    "DO": "1,11",
    "GT": "1,11",
    "MX": "1,11",
    "PA": "1,11",
    "PR": "1,11",
    "TW": "1,11",
    "US": "1,11",
    "UZ": "1,11",
  };

  static Future<String> channel(countryCode) async {

    return _specialSignal[countryCode] ?? "1,13";
  }
}
