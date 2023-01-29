import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:diagnosis_tool/data/helpers/map/map_data_handler.dart';
import 'package:diagnosis_tool/iot/utils/lzo1x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() {
  Future<ByteData> loadAsset() async {
    return await rootBundle.load('assets/mock/origin_slam_map_android.txt');
  }

  test('data map', () async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized(); //<

    ByteData data = await loadAsset();

    // Uint8List dataList = Uint8List.fromList(utf8.encode(data));
    Uint8List dataList = data.buffer.asUint8List();

    var test = Lzo1x.decompressFunc(dataList, dataList.length, 4096);
    print(test);
  });
}
