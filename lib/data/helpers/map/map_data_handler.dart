import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/src/logger.dart';

class MapDataHandler {
  Logger logger;
  int chargeX = -1;
  int chargeY = -1;

  MapDataHandler(this.logger);

  /// 解析数据
  Future<ui.Image> parseMapData(ByteData mapData) {
    Uint8List dataList = mapData.buffer.asUint8List();
    Uint8List head = dataList.sublist(0, 34);

    double mapStartX = _bytesToDouble(head.sublist(0, 4));
    double mapStartY = _bytesToDouble(head.sublist(4, 8));

    int width = _bytesToInt(head.sublist(8, 12));
    int height = _bytesToInt(head.sublist(12, 16));
    Uint8List decodeBytes = dataList.sublist(28);

    Int32List color = _analyzeColor(decodeBytes, width, height);
    return _loadImage(color, width, height);
  }

  /// 解析数据
  Future<ui.Image> parseIntListMapData(List<int> mapData) {
    Uint8List dataList = Uint8List.fromList(mapData);
    Uint8List head = dataList.sublist(0, 34);
    logger.d('head: $head');
    double mapStartX = _bytesToDouble(head.sublist(0, 4));
    logger.d('mapStartX: $mapStartX');
    double mapStartY = _bytesToDouble(head.sublist(4, 8));
    logger.d('mapStartY: $mapStartY');
    int height = _bytesToInt(head.sublist(8, 12));
    logger.d('height: $height');
    int width = _bytesToInt(head.sublist(12, 16));
    logger.d('width: $width');
    Uint8List decodeBytes = dataList.sublist(34);
    logger.d('decodeBytes: ${decodeBytes.length}');

    Int32List color = _analyzeColor(decodeBytes, width, height);
    return _loadImage(color, width, height);
  }

  List<int> obtainChargePosition() {
    return [chargeX, chargeY];
  }

  int _bytesToInt(Uint8List data) {
    ByteData byteData = ByteData.view(data.buffer);
    int value = byteData.getUint32(0, Endian.little);
    return value;
  }

  double _bytesToDouble(Uint8List data) {
    ByteData byteData = ByteData.view(data.buffer);
    double value = byteData.getFloat32(0, Endian.little);
    return value;
  }

  // 获取图片 本地为false 网络为true
  Future<ui.Image> loadImage(var path, bool isUrl) async {
    ImageStream stream;
    if (isUrl) {
      stream = NetworkImage(path).resolve(ImageConfiguration.empty);
    } else {
      stream = AssetImage(path, bundle: rootBundle)
          .resolve(ImageConfiguration.empty);
    }
    Completer<ui.Image> completer = Completer<ui.Image>();
    void listener(ImageInfo frame, bool synchronousCall) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(ImageStreamListener(listener));
    }

    stream.addListener(ImageStreamListener(listener));
    return completer.future;
  }

  Future<ui.Image> _loadImage(Int32List color, int width, int height) {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    decodeImageFromPixels(
      color.buffer.asUint8List(),
      width,
      height,
      PixelFormat.bgra8888,
      (ui.Image image) => completer.complete(image),
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
      } else if (bytes[i] == 0x03) {
        //充电桩坐标
        chargeY = i ~/ width;
        chargeX = i % width == 0 ? (width - 1) : (i % width - 1);
        colors[i] = 0XFFED1941;
      } else {
        colors[i] = 0xFFfdb933;
      }
    }

    return colors;
  }
}
