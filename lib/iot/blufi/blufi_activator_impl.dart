import 'dart:async';

import 'package:blufi/blufi.dart';
import 'package:blufi/models/ble_device.dart';
import 'package:diagnosis_tool/iot/activator.dart';
import 'package:diagnosis_tool/iot/callback/activator_callback.dart';
import 'package:diagnosis_tool/iot/callback/activator_progress.dart';
import 'package:diagnosis_tool/iot/core/command/cmd_response.dart';
import 'package:diagnosis_tool/iot/core/mixin_data_handler.dart';
import 'package:diagnosis_tool/iot/core/command/cmd_request.dart';
import 'package:diagnosis_tool/iot/core/mixin_activator_info.dart';
import 'package:diagnosis_tool/iot/entities/activator_info.dart';
import 'package:diagnosis_tool/iot/utils/log_utils.dart';

class BlufiActivatorImpl
    with MixinActivatorInfo, MixinDataHandler
    implements Activator {
  ActivatorCallback? _callback;
  late final Blufi? _plugin;
  StreamSubscription? customDataSubscription = null;
  StreamSubscription? wifiSubscription = null;
  StreamSubscription? scanSubscription = null;

  BlufiActivatorImpl(ActivatorInfo info, ActivatorCallback callback) {
    _callback = callback;
    _plugin = Blufi();
    convert(info);
  }

  @override
  void start() {
    scanSubscription = _plugin?.scanBluetoothDevice().listen((event) {
      LogUtils.log(event.toString());
      LogUtils.log("Device : ${event.length}");
      if (event.isNotEmpty) {
        _callback?.onProgress(ActivatorProgress.CONNECTING);
        _plugin?.stopScanBluetoothDevice();
        connect(event.first);
      }
    });
  }

  void connect(BleDevices bleDevices) {
    scanSubscription?.cancel();
    _plugin?.connectToBleDevice(bleDevices).listen((event) {
      LogUtils.log("Connection Response : $event");
      _callback?.onProgress(ActivatorProgress.TRANSPORTING);
      Future.delayed(const Duration(seconds: 2)).then((value) {
        _listenCustomData();
      });
    });
  }

  //
  // _sendConfigData() {
  //   wifiSubscription = _blufiPlugin
  //       ?.sendWifiConfig(_activatorInfo!.ssid!, _activatorInfo!.password!)
  //       .listen((event) {
  //     LogUtils.log("Connection Response : $event");
  //     if (event) {
  //       _callback?.onProgress(ActivatorProgress.REGISTERING);
  //       wifiSubscription?.cancel();
  //     }
  //   });
  // }

  _listenCustomData() {
    customDataSubscription = _plugin?.receiveCustomData().listen((event) {
      LogUtils.log("listen data ============================: $event");

      CmdResponse response = handleData(event);
      if (response.isProgress()) {
        if (response.route()) {
          _callback?.onProgress(ActivatorProgress.ROUTER_CONNECTING);
        } else if (response.cloud()) {
          _callback?.onProgress(ActivatorProgress.REGISTERING);
        } else {
          LogUtils.log("Unknown progress");
        }
      } else if (response.isResult()) {
        LogUtils.log("isResult valid ${response.valid()}");
        if (response.valid()) {
          LogUtils.log("Device mac : ${response.mac()}");
          _callback?.onSuccess(response.mac());
        } else {
          _callback?.onFailure("Failed to connect");
        }
      } else {
        _sendCustomData();
      }
    });
    _sendCustomData();
  }

  bool sendCustomEnd = false;

  /// 处理自定义消息
  _sendCustomData() {
    try {
      CmdRequest request = cmdQueue.removeFirst();
      _plugin?.sendCustomData(request.getRequestData());
    } catch (e) {
      if (!sendCustomEnd) {
        sendCustomEnd = true;
      }
    }
  }

  @override
  void stop() {
    _plugin?.dispose();
    customDataSubscription?.cancel();
  }
}
