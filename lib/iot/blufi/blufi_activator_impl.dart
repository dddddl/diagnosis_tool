import 'dart:async';

import 'package:blufi/blufi.dart';
import 'package:diagnosis_tool/iot/activator.dart';
import 'package:diagnosis_tool/iot/callback/activator_callback.dart';
import 'package:diagnosis_tool/iot/callback/activator_progress.dart';
import 'package:diagnosis_tool/iot/core/command/cmd_request.dart';
import 'package:diagnosis_tool/iot/core/mixin_activator_info.dart';
import 'package:diagnosis_tool/iot/entities/activator_info.dart';

class BlufiActivatorImpl with MixinActivatorInfo implements Activator {
  ActivatorInfo? _activatorInfo;
  ActivatorCallback? _callback;
  late final Blufi? _blufiPlugin;

  BlufiActivatorImpl(ActivatorInfo info, ActivatorCallback callback) {
    _activatorInfo = info;
    _callback = callback;
    _blufiPlugin = Blufi();
    convert(info);
  }

  @override
  void start() {
    _blufiPlugin?.scanBluetoothDevice().listen((event) {
      print(event);
      print("Device : ${event.length}");
      if (event.isNotEmpty) {
        _callback?.onProgress(ActivatorProgress.CONNECTING);
        _blufiPlugin?.stopScanBluetoothDevice();
        _blufiPlugin?.connectToBleDevice(event.first).listen((event) {
          print("Connection Response : $event");
          _callback?.onProgress(ActivatorProgress.TRANSPORTING);
          Future.delayed(const Duration(seconds: 2)).then((value) {
            print('delayed');
            _sendConfigData();
          });
        });
      }
    });
  }

  _sendConfigData() {
    _blufiPlugin
        ?.sendWifiConfig(
            _activatorInfo!.ssid!, _activatorInfo!.password!)
        .listen((event) {
      print("Connection Response : $event");
      if (event) {
        _callback?.onProgress(ActivatorProgress.REGISTERING);
      }
    });
  }

  _listenCustomData() {
    _blufiPlugin?.receiveCustomData().listen((event) {
      print("Custom Data : $event");
      _sendCustomData();
    });
  }

  /// 处理自定义消息
  _sendCustomData() {
    try {
      CmdRequest request = cmdQueue.removeFirst();
      _blufiPlugin?.sendCustomData(request.getRequestData());
    } catch (e) {
      print(e);
    }
  }

  @override
  void stop() {
    _blufiPlugin?.dispose();
  }
}
