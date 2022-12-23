import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:ui';

import 'package:archive/archive_io.dart';
import 'package:logger/src/logger.dart';

import 'map_data_interface.dart';

class MapDataHandler extends MapDataInterface {
  Logger logger;

  MapDataHandler(this.logger);

  @override
  Future<Image> handleMapData(String mapData) async {
    List<String> map = mapData.split(' ');

    for (int i = 0; i < map.length; i++) {
      logger.i(map[i]);
    }

    Rect rect = Rect.fromLTRB(double.parse(map[2]), double.parse(map[5]),
        double.parse(map[4]), double.parse(map[3]));

    logger.i('rect $rect');
    logger.i('rect.left ${rect.left}');
    logger.i('rect.top ${rect.top}');
    logger.i('rect.right ${rect.right}');
    logger.i('rect.bottom ${rect.bottom}');

    List<int> stringBytes = base64Url.decode(map.last);

    ZLibDecoder decoder = ZLibDecoder();
    List<int> decodeBytes = decoder.decodeBytes(stringBytes);
    logger.i('decodeBytes length ${decodeBytes.length}');
    logger.i('decodeBytes $decodeBytes');

    int width = (rect.right - rect.left + 1).toInt();
    int height = (rect.top - rect.bottom + 1).toInt();
    logger.i('all size ${width * height}');

    Int32List color = _analyzeColor(decodeBytes, width, height);

    logger.i('decodeBytes length ${color.length}');
    logger.i('decodeBytes $color');

    return _loadImage(color, width, height);
  }

  /// 用于生成雪花噪点数据
  int xorshift32(int x) {
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    return x;
  }

  int seed = 0xDEADBEEF;

  Future<Image> _loadImage(Int32List color, int width, int height) {
    final pixels = Int32List(width * height);
    for (int i = 0; i < pixels.length; i++) {
      seed = pixels[i] = xorshift32(seed);
    }

    final Completer<Image> completer = Completer<Image>();
    decodeImageFromPixels(
      // Uint8List.fromList(List<int>.filled(width * height * 4, 0xFF)),
      color.buffer.asUint8List(),
      // pixels.buffer.asUint8List(),
      width,
      height,
      PixelFormat.rgba8888,
      // Don't worry about disposing or cloning this image - responsibility
      // is transferred to the caller, and that is safe since this method
      // will not touch it again.
      (Image image) => completer.complete(image),
    );
    return completer.future;
  }

  Int32List _analyzeColor(List<int> bytes, int width, int height) {
    Int32List colors = Int32List(width * height);

    for (int i = 0; i < bytes.length; i++) {
      if (bytes[i] == 0) {
        //未探索
        colors[i] = 0xFFF5F5F5;
      } else if (bytes[i] == 1) {
        //已探索
        colors[i] = 0xFF80722D;
      } else if (bytes[i] == 2) {
        //机身覆盖区
        colors[i] = 0xFF3D2D80;
      } else if (bytes[i] == 3) {
        //已清扫区
        colors[i] = 0xFFE3709D;
      } else if (bytes[i] == 4) {
        //障碍物点action_newmap_data
        colors[i] = 0xFF70E3B0;
      } else if (bytes[i] == 5) {
        //碰撞点
        colors[i] = 0xFFD270E3;
      } else if (bytes[i] == 6) {
        //手绘虚拟墙点
        colors[i] = 0xFFBEE370;
      } else if (bytes[i] == 7) {
        //垃圾较多点
        colors[i] = 0xFFD7E370;
      } else if (bytes[i] == 8) {
        //充电座区
        colors[i] = 0xFFE3707A;
      } else if (bytes[i] == 9) {
        //充电座区
        colors[i] = 0xFFE3707A;
      } else if (bytes[i] == 10) {
        //垃圾较多点
        colors[i] = 0xFFD7E370;
      } else if (bytes[i] == 11) {
        //手绘虚拟墙点
        colors[i] = 0xFFD7E370;
      } else if (bytes[i] == 12) {
        //手绘虚拟墙点
        colors[i] = 0xFFD7E370;
      } else if (bytes[i] == 13) {
        //手绘虚拟墙点
        colors[i] = 0xFFD7E370;
      } else if (bytes[i] == 14) {
        //手绘虚拟墙点
        colors[i] = 0xFFD7E370;
      } else if (bytes[i] == 15) {
        //手绘虚拟墙点
        colors[i] = 0xFFD7E370;
      } else if (bytes[i] == 99) {
        //轨迹点
        colors[i] = 0x99000000;
      } else {
        colors[i] = 0x99000000;
      }
    }

    return colors;
  }
}
