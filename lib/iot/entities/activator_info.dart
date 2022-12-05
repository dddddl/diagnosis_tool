import '../callback/activator_callback.dart';

/// 配网信息类
class ActivatorInfo {
  // wifi ssid
  String? ssid;

  // wifi 密码
  String? password;

  // 配网超时时间
  int? timeOut;

  // 配网token
  String? bindToken;

  // 时区 GMT +8:00
  String? timeZone;

  // 地区信道
  String? channel;

  // 所选服务器host
  String? deviceHost;

  ActivatorCallback? callback;

  ActivatorInfo(this.ssid, this.password, this.timeOut, this.bindToken,
      this.timeZone, this.channel, this.deviceHost, this.callback);

  ActivatorInfo.build(
      String? ssid,
      String? password,
      int? timeout,
      String? bindToken,
      String? timezone,
      String? channel,
      String? deviceHost,
      ActivatorCallback? callback)
      : this(ssid, password, timeout, bindToken, timezone, channel, deviceHost,
            callback);

  ActivatorInfo.buildNoPassword(
      String? ssid,
      int? timeout,
      String? bindToken,
      String? timezone,
      String? channel,
      String? deviceHost,
      ActivatorCallback? callback)
      : this(ssid, null, timeout, bindToken, timezone, channel, deviceHost,
            callback);
}
