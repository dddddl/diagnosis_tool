import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:ui';

import 'package:archive/archive_io.dart';
import 'map_data_interface.dart';

class MapDataHandler extends MapDataInterface {
  @override
  Future<Image> handleMapData(String mapData) async {
    List<String> map = mapData.split(' ');

    for (int i = 0; i < map.length; i++) {
      print(map[i]);
    }

    Rect rect = Rect.fromLTRB(double.parse(map[2]), double.parse(map[5]),
        double.parse(map[4]), double.parse(map[3]));

    print('rect $rect');
    print('rect.left ${rect.left}');
    print('rect.top ${rect.top}');
    print('rect.right ${rect.right}');
    print('rect.bottom ${rect.bottom}');

    List<int> stringBytes = base64Url.decode(map.last);

    ZLibDecoder decoder = ZLibDecoder();
    List<int> decodeBytes = decoder.decodeBytes(stringBytes);
    print('decodeBytes length ${decodeBytes.length}');
    print('decodeBytes $decodeBytes');

    int width = (rect.right - rect.left + 1).toInt();
    int height = (rect.top - rect.bottom + 1).toInt();
    print('all size ${width * height}');

    Int32List color = _analyzeColor(decodeBytes, width, height);

    print('decodeBytes length ${color.length}');
    print('decodeBytes $color');

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

  Future<Image> _convert(Uint8List list) async {
    final codec = await instantiateImageCodec(list);
    FrameInfo frame = await codec.getNextFrame();
    return frame.image;
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
        colors[i] = 0xFFFFFFFF;
      } else {
        colors[i] = 0xFFFFFFFF;
      }
    }

    return colors;
  }
}
