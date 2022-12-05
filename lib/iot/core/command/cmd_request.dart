import 'dart:typed_data';

import '../../utils/cmd_utils.dart';
import 'cmd_builder.dart';
import 'cmd_config.dart';

class CmdRequest {
  int id;
  int length;
  Uint8List data;

  CmdRequest(CmdBuilder cmdBuilder)
      : id = cmdBuilder.id,
        length = cmdBuilder.data.length,
        data = cmdBuilder.data;

  int getRequestLength() {
    return length + headSize;
  }

  Uint8List getRequestData() {
    Uint8List raw = Uint8List(getRequestLength());
    var id = CmdUtils.intTo2Bytes(this.id);
    raw.setRange(0, 2, id);
    var length = CmdUtils.intTo2Bytes(this.length);
    raw.setRange(2, 4, length);
    raw.setAll(4, data);
    return raw;
  }

}
