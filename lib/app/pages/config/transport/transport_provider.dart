import 'dart:async';

import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/iot/activator.dart';
import 'package:diagnosis_tool/iot/blufi/blufi_activator.dart';
import 'package:diagnosis_tool/iot/callback/activator_callback.dart';
import 'package:diagnosis_tool/iot/callback/activator_progress.dart';
import 'package:diagnosis_tool/iot/core/ble/le_activator.dart';
import 'package:diagnosis_tool/iot/entities/activator_info.dart';
import 'package:diagnosis_tool/iot/entities/le_activator_info.dart';
import 'package:diagnosis_tool/iot/iot.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/src/logger.dart';

part 'transport_provider.freezed.dart';

part 'transport_provider.g.dart';

@freezed
class TransportState with _$TransportState {
  const factory TransportState({
    String? ssid,
    String? password,
    int? progress,
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

  TransportStateNotifier(TransportState state, this.logger) : super(state) {
    activator = Iot.getBlufiActivator();
  }

  final int _timeout = 98;

  void listenTransportState(String? ssid, String? password) {
    _countdown();
    _startTransport(ssid, password);
  }

  void _startTransport(String? ssid, String? password) {
    activator?.start(
        ActivatorInfo(ssid, password, 90, "bindToken", "timeZone", "channel",
            "robot.china-dongcheng.com"),
        ActivatorCallback(
          onSuccess: (result) {
            logger.i("onSuccess");
            state = state.copyWith(progress: 100);
            timer?.cancel();
          },
          onFailure: (e) {
            logger.i("onFailure");
            state = state.copyWith(isFailed: true);
          },
          onProgress: (progress) {
            logger.i("onProgress");
            progress == ActivatorProgress.CONNECTING
                ? state = state.copyWith(
                    progress:
                        (state.progress ?? 0) > 10 ? (state.progress ?? 0) : 10)
                : progress == ActivatorProgress.TRANSPORTING
                    ? state = state.copyWith(
                        progress: (state.progress ?? 0) > 50
                            ? (state.progress ?? 0)
                            : 50)
                    : progress == ActivatorProgress.REGISTERING
                        ? state = state.copyWith(
                            progress: (state.progress ?? 0) > 90
                                ? (state.progress ?? 0)
                                : 90)
                        : state = state.copyWith(progress: 0);

            if (progress == ActivatorProgress.REGISTERING) {
              state = state.copyWith(isSuccess: true);
            }
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
        Future.delayed(const Duration(seconds: 5), () {
          state = state.copyWith(isFailed: true);
          timer.cancel();
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    activator?.onStop();
    super.dispose();
  }
}
