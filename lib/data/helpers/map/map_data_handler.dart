import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:logger/src/logger.dart';

import 'map_data_interface.dart';

class MapDataHandler extends MapDataInterface {
  Logger logger;

  MapDataHandler(this.logger);

  @override
  Future<Image> parseMapData(ByteData mapData) {
    Uint8List dataList = mapData.buffer.asUint8List();
    Uint8List head = dataList.sublist(0, 34);
    int width = bytesToInt(head.sublist(8, 12));
    int height = bytesToInt(head.sublist(12, 16));
    Uint8List decodeBytes = dataList.sublist(28);
    Int32List color = _analyzeColor(decodeBytes, width, height);
    return _loadImage(color, width, height);
  }

  int bytesToInt(Uint8List data) {
    ByteData byteData = ByteData.view(data.buffer);
    int value = byteData.getUint32(0, Endian.little);
    return value;
  }

  Future<Image> _loadImage(Int32List color, int width, int height) {
    final Completer<Image> completer = Completer<Image>();
    decodeImageFromPixels(
      color.buffer.asUint8List(),
      width,
      height,
      PixelFormat.bgra8888,
      (Image image) => completer.complete(image),
    );
    return completer.future;
  }

  Int32List _analyzeColor(Uint8List bytes, int width, int height) {
    Int32List colors = Int32List(width * height);
    // 小端数据
    for (int i = 0; i < bytes.length; i++) {
      if (bytes[i] == 0x00) {
        //未探索
        colors[i] = 0xFFF5F5F5;
      } else if (bytes[i] == 0x01) {
        //边界
        colors[i] = 0XFF4D4F36;
      } else if (bytes[i] == 0x02) {
        //草坪
        colors[i] = 0XFF225A1F;
      } else {
        colors[i] = 0xFFF5F5F5;
      }
    }

    return colors;
  }
}
