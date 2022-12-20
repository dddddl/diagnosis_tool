import 'dart:convert';
import 'dart:typed_data';

import 'package:diagnosis_tool/iot/utils/log_utils.dart';

abstract class CmdUtils {
  /// int 转 2个字节数组
  static Uint8List intTo2Bytes(int data) {
    var idByte = ByteData(2);
    idByte.setInt16(0, data);
    var bytes = idByte.buffer.asUint8List();
    return bytes;
  }

  static int twoBytesToInt(Uint8List data, int index) {
    // 使用ByteData从字节数组的指定位置读取两个字节
    ByteData byteData = ByteData.view(data.buffer, index);
    int value = byteData.getUint16(0, Endian.big);
    return value;
  }

  ///base64 加密
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  ///base64 解密
  static String decodeBase64(String data) {
    Uint8List body = base64Decode(data);
    String result = const Utf8Decoder().convert(body);
    return result;
  }
}
