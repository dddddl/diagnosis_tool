import 'dart:convert';
import 'dart:typed_data';

import 'package:diagnosis_tool/iot/core/command/cmd_response.dart';
import 'package:diagnosis_tool/iot/utils/cmd_utils.dart';
import 'package:diagnosis_tool/iot/utils/log_utils.dart';

import '../../entities/iot_exception.dart';
import 'cmd_config.dart';
import 'cmd_request.dart';

class CmdBuilder {
  late int id;
  late Uint8List data;

  CmdBuilder setId(int id) {
    this.id = id;
    return this;
  }

  CmdBuilder setStringData(String data) {
    return setBytesData(utf8.encode(data));
  }

  CmdBuilder setBytesData(List<int> data) {
    this.data = Uint8List.fromList(data);
    return this;
  }

  CmdRequest buildRequest() => CmdRequest(this);

  CmdResponse buildResponse() => CmdResponse(this);
}
