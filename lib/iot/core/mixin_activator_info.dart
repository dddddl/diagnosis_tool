import 'dart:collection';

import 'package:diagnosis_tool/iot/core/command/cmd_builder.dart';

import '../entities/activator_info.dart';
import 'command/cmd_config.dart';
import 'command/cmd_request.dart';

mixin MixinActivatorInfo {
  ListQueue<CmdRequest> cmdQueue = ListQueue();

  convert(ActivatorInfo info) {
    cmdQueue.clear();

    // var wifiInfo = "${info.ssid}\n${info.password ?? ""}";
    //
    // cmdQueue.add(CmdBuilder()
    //     .setId(CMD_WIFI_INFO)
    //     .setStringData(wifiInfo)
    //     .buildRequest());

    cmdQueue.add(CmdBuilder()
        .setId(CMD_HOST_INFO)
        .setStringData(info.deviceHost ?? "")
        .buildRequest());

    cmdQueue.add(CmdBuilder()
        .setId(CMD_BINDTOKEN_INFO)
        .setStringData(info.bindToken ?? "")
        .buildRequest());

    cmdQueue.add(CmdBuilder()
        .setId(CMD_TIMEZONE_INFO)
        .setStringData(info.timeZone ?? "")
        .buildRequest());

    cmdQueue.add(CmdBuilder()
        .setId(CMD_CHANNEL_INFO)
        .setStringData(info.channel ?? "")
        .buildRequest());
  }
}
