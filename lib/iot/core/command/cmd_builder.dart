import 'dart:convert';
import 'dart:typed_data';

import 'package:diagnosis_tool/iot/utils/cmd_utils.dart';

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

  CmdBuilder setRaw(Uint8List data) {
    int size = data.length;
    if (size < headSize) {
      throw IotException("raw size must >= $headSize");
    }

    data[0] = data[0] & 0x7F;
    id = CmdUtils.twoBytesToInt(data, 0);
    print("id $id");

    int length = CmdUtils.twoBytesToInt(data, 2);
    print("length $length");

    if (length != size - headSize) {
      throw IotException("length size must == raw size - $headSize");
    }

    this.data = Uint8List(length);
    this.data.setRange(0, size - 4, data, 4);
    print("data $data");
    return this;
  }

  CmdRequest buildRequest() => CmdRequest(this);

}
