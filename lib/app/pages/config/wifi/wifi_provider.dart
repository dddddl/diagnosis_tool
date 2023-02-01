import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/data/constants.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/src/logger.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'wifi_provider.freezed.dart';

part 'wifi_provider.g.dart';

@freezed
class WifiState with _$WifiState {
  // ssid
  // password

  const factory WifiState({
    String? ssid,
    String? password,
    @Default(false) bool obscureText,
  }) = _WifiState;

  factory WifiState.fromJson(Map<String, dynamic> json) =>
      _$WifiStateFromJson(json);
}

final wifiProvider =
    StateNotifierProvider.autoDispose<WifiStateNotifier, WifiState>(
        (ref) => WifiStateNotifier(ref.read(logger)));

class WifiStateNotifier extends StateNotifier<WifiState> {
  Logger logger;

  WifiStateNotifier(this.logger) : super(WifiState());

  StreamSubscription? connectivitySubscription;

  void setSsid(String ssid) {
    state = state.copyWith(ssid: ssid);

    SharedPreferences.getInstance().then((prefs) {
      List<String>? localWiFiPwd =
          prefs.getStringList(Constants.localWiFiAndPwd);
      localWiFiPwd ??= [];
      // 如果存在内容相似的wifi名，则获取密码
      for (var element in localWiFiPwd) {
        if (element.contains(state.ssid! + Constants.split)) {
          state = state.copyWith(password: element.split(Constants.split)[1]);
          return;
        }
      }
    });
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setObscureText(bool obscureText) {
    state = state.copyWith(obscureText: obscureText);
  }

  void saveWifiInfo() {
    SharedPreferences.getInstance().then((prefs) {
      List<String>? localWiFiPwd =
          prefs.getStringList(Constants.localWiFiAndPwd);
      localWiFiPwd ??= [];

      if (localWiFiPwd
          .contains(state.ssid! + Constants.split + state.password!)) {
        return;
      }

      // 如果存在内容相似的wifi密码，则删除
      localWiFiPwd.removeWhere((element) {
        return element.contains(state.ssid! + Constants.split);
      });
      localWiFiPwd.add(state.ssid! + Constants.split + state.password!);

      prefs.setStringList(Constants.localWiFiAndPwd, localWiFiPwd);
    });
  }

// 获取当前连接的wifi ssid
  void listenWiFiState() async {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.wifi) {
        logger.i('Connected to WiFi');

        String? wifiName = await getWifiName() ?? '';
        logger.i(wifiName);
        setSsid(wifiName.replaceAll('"', ''));
      } else {
        logger.i('Not connected to WiFi');
        setSsid('');
      }
    });
  }

  Future<String?> getWifiName() async {
    return await NetworkInfo().getWifiName();
  }

  bool isValidate() {
    return isWifiConnected() && isPasswordValid();
  }

// wifi名是否合法
  bool isWifiConnected() {
    return state.ssid != null;
  }

// 密码是否合法
  bool isPasswordValid() {
    return state.password != null && state.password!.length >= 8;
  }

// 是否输入密码
  bool isPasswordEmpty() {
    return state.password == null || state.password!.isEmpty;
  }

  @override
  void dispose() {
    connectivitySubscription?.cancel();
    super.dispose();
  }
}
