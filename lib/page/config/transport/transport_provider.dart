import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stratosfy_esp_ble_provisioning/esp_bluetooth_provisioning.dart';
import 'package:stratosfy_esp_ble_provisioning/models/BleDevice.dart';
import 'package:stratosfy_esp_ble_provisioning/models/enums.dart';

part 'transport_provider.freezed.dart';
part 'transport_provider.g.dart';

@freezed
class TransportState with _$TransportState {
  const factory TransportState({
    String? ssid,
    String? password,
    String? progress,
    bool? isFailed,
  }) = _TransportState;

  factory TransportState.fromJson(Map<String, dynamic> json) =>
      _$TransportStateFromJson(json);
}

final transportProvider =
    StateNotifierProvider.autoDispose<TransportStateNotifier, TransportState>(
        (ref) => TransportStateNotifier(const TransportState()));

class TransportStateNotifier extends StateNotifier<TransportState> {
  StreamSubscription<List<BleDevices>>? controller;
  List<BleDevices> devices = [];

  Timer? timer;
  TransportStateNotifier(super.state);

  final int _timeout = 10;

  //*******Listen for bluetooth state***********
  startListening() async {
    print("** Listening **");
    EspBleProvisioning().getBluetoothStateStream().listen((state) async {
      print("State *********** $state");
    });
  }

//*******Scan for bluetooth device***********
  scanBleDevice(String? ssid, String? password) async {
    controller =
        EspBleProvisioning().scanBluetoothDevice().listen((value) async {
      if (value.isNotEmpty) {
        print("************DEVICE SCAN RESULT : $value");

        List names = [];
        devices.clear();
        for (int i = 0; i < value.length; i++) {
          if (!names.contains(value[i].name)) {
            devices.add(BleDevices(value[i].name, value[i].id));
          }
          names.add(value[i].name);
        }

        print('cancel scan');
        controller?.cancel();

        if (devices.isNotEmpty) {
          connectBleDevice(devices[0].id, ssid, password);
        }
      }
    });
  }

  //*******Connect to bluetooth device***********
  connectBleDevice(String pin, String? ssid, String? password) async {
    print("Connect to Device**************** ${devices[0].name}");

    controller = EspBleProvisioning()
        .connectToBluetoothDevice(devices[0].name, pin)
        .listen((value) async {
      if (value == "success") {
        print(value);
        devices.clear();
        print("************security check completed");
      } else {}

      provisionDevice(ssid!, password!);
    }) as StreamSubscription<List<BleDevices>>?;

    return true;
  }

  //*******Provision device***********
  provisionDevice(String ssid, String password) async {
    // isLoading = true;
    // loading = "Provisioning device";
    //todo testing only
    // ssid = "BM_Technovations_24";
    // password = (password == "") ?  "M@n1vannan" : password;
    print("START WIFI PROVISIONING ---> $ssid $password");
    EspBleProvisioning().startProvisioning(ssid, password).then((value) async {
      print("FrontEnd : $value");
      // isLoading = false;
      // isScanned = false;
      devices.clear();
      print("Provision Status ----------> $value");
      // showSnackBar(value);
      print(_getStatusFromKey(value));
      return true;
    });
  }

  String _getStatusFromKey(ProvisionState key) {
    print(key);
    switch (key) {
      case ProvisionState.CREATE_SESSION_FAILED:
        return "Failed to establish session with device";
      case ProvisionState.WIFI_CONFIG_SENT:
        return "Wifi credentials sent to device";
      case ProvisionState.WIFI_CONFIG_FAILED:
        return "Wifi credentials failed";
      case ProvisionState.WIFI_CONFIG_APPLIED:
        return "Wifi credentials applied to device";
      case ProvisionState.DEVICE_PROVISIONING_SUCCESS:
        return "Device provisioned successfully";
      default:
        return "Device provisioning failed";
    }
  }

  void listenTransportState(String? ssid, String? password) {
    _countdown();
    scanBleDevice(ssid, password);
  }

  void _countdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick <= _timeout) {
        state = state.copyWith(progress: "${timer.tick}%");
        print(state.progress);
      }

      if (timer.tick == _timeout) {
        Future.delayed(const Duration(seconds: 5), () {
          state = state.copyWith(isFailed: true);
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    controller?.cancel();
    super.dispose();
  }
}
