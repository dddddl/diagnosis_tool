import 'package:diagnosis_tool/iot/core/command/cmd_request.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../entities/ble_config.dart';
import 'le_transport.dart';

mixin MixinLeTransportImpl implements LeTransport {
  /// 连接设备
  @override
  void connect(ScanResult scanResult, int timeout) async {
    await scanResult.device
        .connect(timeout: Duration(seconds: timeout), autoConnect: false);

    scanResult.device.state.listen((event) async {
      print("device state $event");
      if (event == BluetoothDeviceState.connected) {
        print("connected  discoverServices");
        await discoverService(scanResult);
      } else if (event == BluetoothDeviceState.disconnected) {
      } else if (event == BluetoothDeviceState.connecting) {
      } else if (event == BluetoothDeviceState.disconnecting) {}
    });
  }

  /// 发现服务
  Future<void> discoverService(ScanResult scanResult) async {
    await scanResult.device.requestMtu(185);
    List<BluetoothService>? services =
        await scanResult.device.discoverServices();

    BluetoothService? service = services.firstWhere(
        (element) => element.uuid.toString() == LeConfig.serviceUuid);

    if (service == null) {
      // 未找到服务 退出

      return;
    }

    BluetoothCharacteristic? tx = service?.characteristics.firstWhere(
        (element) => element.uuid == Guid.fromMac(LeConfig.characterWriteUuid));

    BluetoothCharacteristic? rx = service?.characteristics.firstWhere(
        (element) => element.uuid == Guid.fromMac(LeConfig.characterReadUuid));

    if (tx == null || rx == null) {
      // 未找到特征值 退出

      return;
    }

    bool notify = await rx.setNotifyValue(true);
    if (!notify) {
      // 未开启通知 退出
      return;
    }
  }

  /// 释放资源
  @override
  void release(ScanResult? scanResult) {
    scanResult?.device.disconnect();
  }

  /// 响应
  @override
  bool response(CmdRequest request) {
    return true;
  }

  /// 发送
  @override
  bool send(CmdRequest request) {
    return true;
  }
}
