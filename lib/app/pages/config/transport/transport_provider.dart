import 'dart:async';

import 'package:deviceinfo/deviceinfo.dart';
import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/app/utils/channel_util.dart';
import 'package:diagnosis_tool/data/constants.dart';
import 'package:diagnosis_tool/iot/activator.dart';
import 'package:diagnosis_tool/iot/blufi/blufi_activator.dart';
import 'package:diagnosis_tool/iot/callback/activator_callback.dart';
import 'package:diagnosis_tool/iot/callback/activator_progress.dart';
import 'package:diagnosis_tool/iot/core/ble/le_activator.dart';
import 'package:diagnosis_tool/iot/entities/activator_info.dart';
import 'package:diagnosis_tool/iot/entities/le_activator_info.dart';
import 'package:diagnosis_tool/iot/iot.dart';
import 'package:diagnosis_tool/iot/utils/time_util.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/src/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'transport_provider.freezed.dart';

part 'transport_provider.g.dart';

@freezed
class TransportState with _$TransportState {
  const factory TransportState({
    String? ssid,
    String? password,
    int? progress,
    String? status,
    bool? isFailed,
    bool? isSuccess,
  }) = _TransportState;

  factory TransportState.fromJson(Map<String, dynamic> json) =>
      _$TransportStateFromJson(json);
}

final transportProvider =
    StateNotifierProvider.autoDispose<TransportStateNotifier, TransportState>(
        (ref) =>
            TransportStateNotifier(const TransportState(), ref.read(logger)));

class TransportStateNotifier extends StateNotifier<TransportState> {
  Timer? timer;
  BlufiActivator? activator;
  Logger logger;

  Deviceinfo? _deviceInfo;

  TransportStateNotifier(TransportState state, this.logger) : super(state) {
    activator = Iot.getBlufiActivator();
    _deviceInfo = Deviceinfo();
  }

  final int _timeout = 98;

  void listenTransportState(String? ssid, String? password) {
    _countdown();
    _startTransport(ssid, password);
  }

  Future<void> _startTransport(String? ssid, String? password) async {

    String timezone = TimeZoneUtil.createGmtOffsetString(
        true, true, DateTime.now().timeZoneOffset.inMilliseconds);
    String? countryCode = await _deviceInfo?.getPlatformCountryCode();
    String channel = await ChannelUtil.channel(countryCode);
    activator?.start(
        ActivatorInfo(ssid, password, 90, "bindToken", timezone, channel,
            "robot.china-dongcheng.com"),
        ActivatorCallback(
          onSuccess: (result) {
            logger.i("onSuccess $result");
            state = state.copyWith(progress: 100);
            timer?.cancel();
            SharedPreferences.getInstance().then((prefs) {
              List<String>? localRobots =
                  prefs.getStringList(Constants.localRobots);
              localRobots ??= [];
              localRobots.contains(result)
                  ? logger.i("robot already exists")
                  : localRobots.add(result);

              prefs.setStringList(Constants.localRobots, localRobots);
            });
            Future.delayed(const Duration(seconds: 1)).then((value) {
              state = state.copyWith(isSuccess: true);
            });
          },
          onFailure: (e) {
            logger.i("onFailure");
            state = state.copyWith(isFailed: true);
          },
          onProgress: (progress) {
            logger.i("onProgress $progress");
            progress == ActivatorProgress.CONNECTING
                ? state = state.copyWith(
                    progress:
                        (state.progress ?? 0) > 10 ? (state.progress ?? 0) : 10,
                    status: "连接蓝牙中")
                : progress == ActivatorProgress.TRANSPORTING
                    ? state = state.copyWith(
                        progress: (state.progress ?? 0) > 30
                            ? (state.progress ?? 0)
                            : 30,
                        status: "传输数据中")
                    : progress == ActivatorProgress.ROUTER_CONNECTING
                        ? state = state.copyWith(
                            progress: (state.progress ?? 0) > 60
                                ? (state.progress ?? 0)
                                : 60,
                            status: "连接路由器中")
                        : progress == ActivatorProgress.REGISTERING
                            ? state = state.copyWith(
                                progress: (state.progress ?? 0) > 90
                                    ? (state.progress ?? 0)
                                    : 90,
                                status: "注册设备中")
                            : state = state.copyWith(progress: 0, status: "扫描蓝牙中");
          },
        ));
  }

  void _countdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if ((state.progress ?? 0) <= _timeout) {
        state = state.copyWith(progress: 1 + (state.progress ?? 0));
        logger.i(state.progress.toString());
      } else {
        timer.cancel();
      }

      if (timer.tick >= _timeout) {
        state = state.copyWith(isFailed: true);
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    activator?.onStop();
    _deviceInfo = null;
    super.dispose();
  }
}
