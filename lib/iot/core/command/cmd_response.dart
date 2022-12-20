import 'dart:convert';
import 'dart:typed_data';

import 'package:diagnosis_tool/iot/utils/cmd_utils.dart';

import 'cmd_builder.dart';
import 'cmd_config.dart';

class CmdResponse {
  int id = 0;
  int length;
  Uint8List data;

  CmdResponse(CmdBuilder cmdBuilder)
      : id = cmdBuilder.id,
        length = cmdBuilder.data.length,
        data = cmdBuilder.data;

  int getRequestLength() {
    return length + headSize;
  }

  /// 2 bytes id  2 bytes length
  Uint8List getResponseData() {
    Uint8List raw = Uint8List(getRequestLength());

    var id = CmdUtils.intTo2Bytes(this.id);
    raw.setRange(0, 2, id);
    var length = CmdUtils.intTo2Bytes(this.length);
    raw.setRange(2, 4, length);
    raw.setRange(4, 4 + this.length, data);

    raw[0] = raw[0] | 0x80;

    return raw;
  }

  bool isProgress() {
    return id == 0x00de;
  }

  bool route() {
    return data[0] == 0x01;
  }

  bool cloud() {
    return data[0] == 0x02;
  }

  bool isResult() {
    return id == 0x00df;
  }

  String mac() {
    try {
      Uint8List macList = data.sublist(1);
      return macList.map((e) => e.toRadixString(16).padLeft(2, '0')).join(':');
    } catch (e) {
      return '';
    }
  }

  bool valid() {
    return data[0] == 0x00;
  }
}
