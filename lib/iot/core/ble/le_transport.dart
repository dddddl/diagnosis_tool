import 'package:diagnosis_tool/iot/core/command/cmd_request.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

abstract class LeTransport {
  void  connect(ScanResult scanResult, int timeout);

  bool send(CmdRequest request);

  bool response(CmdRequest request);

  void release(ScanResult? scanResult);
}
