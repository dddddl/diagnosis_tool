import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:diagnosis_tool/data/helpers/map/map_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() {
  Future<ByteData> loadAsset() async {
    return await rootBundle.load('assets/mock/origin_slam_map.txt');
  }

  int bytesToInt(Uint8List data) {
    // 使用ByteData从字节数组的指定位置读取两个字节
    ByteData byteData = ByteData.view(data.buffer);
    int value = byteData.getUint32(0, Endian.little);
    return value;
  }

  test('data map', () async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized(); //<

    ByteData data = await loadAsset();

    // Uint8List dataList = Uint8List.fromList(utf8.encode(data));
    Uint8List dataList = data.buffer.asUint8List();
    // print(dataList);
    Uint8List head = dataList.sublist(0, 34);
    Uint8List widthList = head.sublist(8, 12);
    print(widthList);
    int width = bytesToInt(widthList);
    print(width);
    int height = bytesToInt(head.sublist(12, 16));
    print(height);

    Uint8List decodeBytes = dataList.sublist(34);

    expect(width, 249);
    expect(height, 148);
  });
}
