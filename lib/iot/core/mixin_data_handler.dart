import 'dart:typed_data';

import 'package:diagnosis_tool/iot/core/command/cmd_builder.dart';
import 'package:diagnosis_tool/iot/entities/error_code.dart';
import 'package:diagnosis_tool/iot/entities/iot_exception.dart';
import 'package:diagnosis_tool/iot/utils/cmd_utils.dart';
import 'package:diagnosis_tool/iot/utils/log_utils.dart';

import 'command/cmd_response.dart';

mixin MixinDataHandler {
  /// 命令id
  static const int _commandLength = 2;

  /// data length
  static const int _dataLength = 2;

  CmdResponse handleData(msg) {
    LogUtils.log('-------readMsg-------');
    Uint8List uint8list = Uint8List.fromList(msg);

    var length = _commandLength + _dataLength;
    if (length > uint8list.length) {
      LogUtils.log('-------长度出错 error-------');
      throw IotException(
          ErrorCode.ACTIVATOR_FAILED_RECEIVE_MSG_TCP_LENGTH_EXCEPTION);
    }

    Uint8List fixedData = Uint8List(length);
    fixedData.setRange(0, length, msg);
    LogUtils.log('-------fixedData-------');
    LogUtils.log(fixedData);

    var id = CmdUtils.twoBytesToInt(fixedData, 0);
    LogUtils.log('id$id');

    var dataLength = CmdUtils.twoBytesToInt(fixedData, 2);
    LogUtils.log('dataLength$dataLength');

    if (dataLength <= 0) {
      LogUtils.log("dataLength error");
      throw IotException(
          ErrorCode.ACTIVATOR_FAILED_RECEIVE_MSG_TCP_LENGTH_EXCEPTION);
    }

    Uint8List data = Uint8List(dataLength);
    data.setAll(0, uint8list.sublist(length, length + dataLength));
    LogUtils.log('-------data-------');
    LogUtils.log(data);

    CmdResponse cmdResponse = CmdBuilder().setId(id).setBytesData(data).buildResponse();
    if (msg[0] & 0x80 == 0x80) {
      LogUtils.log("收到的是响应");
      data[0] == 0 ? LogUtils.log("响应成功") : LogUtils.log("响应失败");
    } else {
      LogUtils.log("收到的是请求");
    }

    return cmdResponse;
  }
}
