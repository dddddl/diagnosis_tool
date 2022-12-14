import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final scanProvider = StateNotifierProvider((ref) => ScanStateNotifier());

class ScanStateNotifier extends StateNotifier {
  ScanStateNotifier() : super(null);
}
