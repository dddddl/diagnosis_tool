import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:archive/archive.dart';
import 'package:diagnosis_tool/data/helpers/map/map_data_handler.dart';
import 'package:diagnosis_tool/iot/utils/lzo1x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() {
  Future<ByteData> loadAsset() async {
    return await rootBundle.load('assets/mock/target.bin');
  }

  test('data map', () async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();

    ByteData data = await loadAsset();

    // Uint8List dataList = Uint8List.fromList(utf8.encode(data));
    Uint8List dataList = data.buffer.asUint8List();

    var bytes = GZipEncoder().encode(dataList);
    print(bytes);


  });
}
