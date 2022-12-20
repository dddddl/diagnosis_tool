/// 错误码
class ErrorCode {
  static const String INTERNAL_SERVER_ERROR_MESSAGE = "Internal Server Error";

  static const String SUCCESS = "0";

  /// 未分类原因导致配网超时。兜底错误码。
  static const String ACTIVATOR_FAILED_TIMEOUT = "1001";

  /// 设备已连接路由器，未在服务端查到设备。超时
  static const String ACTIVATOR_FAILED_TIMEOUT_NETWORK = "1006";

  /// BLE连接错误
  static const String ACTIVATOR_NO_FOUNT_BLE_DEVICE = "2000";

  /// 重复配网
  static const String ACTIVATOR_FAILED_BUSY = "2001";

  /// BLE连接失败
  static const String ACTIVATOR_FAILED_LE_CONNECT = "2002";

  /// BLE已连接，但没法通信
  static const String ACTIVATOR_FAILED_LE_ERROR_RX = "2003";

  /// BLE连接异常断开
  static const String ACTIVATOR_FAILED_LE_DISCONNECT_ERROR = "2004";

  /// BLE发送数据错误
  static const String ACTIVATOR_FAILED_LE_SEND = "2005";

  /// BLE配网超时
  static const String ACTIVATOR_FAILED_LE_TIMEOUT = "2006";

  /**
   *--------------------------------AP连接错误 （3xxx）--------------------------------------------------------------
   */

  /// 没有找到扫地机的AP热点
  static const String ACTIVATOR_FAILED_NOT_FOUND_DEVICE_AP = "3001";

  /// 重复配网。原因：TCP端口被占用
  static const String ACTIVATOR_FAILED_REPEAT_CONNECT = "3002";

  /// 连接扫地机热点, 建立TCP时，未连接成功
  static const String ACTIVATOR_FAILED_CONNECT_DEVICE_TCP = "3004";

  /// 连接扫地机热点, 建立TCP时发生IO Exception
  static const String ACTIVATOR_FAILED_CONNECT_DEVICE_TCP_IO_EXCEPTION = "3005";

  /// AP发送数据错误。原因：发送TCP消息时，发生IO Exception
  static const String ACTIVATOR_FAILED_SEND_MSG_TCP_IO_EXCEPTION = "3006";

  /// AP发送数据错误。原因：发送TCP消息时，已经断开连接了 flag 为flase
  static const String ACTIVATOR_FAILED_SEND_MSG_TCP_FLAG_FALSE = "3007";

  /// AP发送数据错误。原因：接受TCP消息时，发生IO Exception
  static const String ACTIVATOR_FAILED_RECEIVE_MSG_TCP_IO_EXCEPTION = "3008";

  /// AP发送数据错误。原因：接受TCP消息时，CRC8校验不通过
  static const String ACTIVATOR_FAILED_RECEIVE_MSG_TCP_CRC8_EXCEPTION = "3009";

  /// AP发送数据错误。原因：接受TCP消息时，数据长度异常
  static const String ACTIVATOR_FAILED_RECEIVE_MSG_TCP_LENGTH_EXCEPTION =
      "3010";

  /// AP发送数据错误。原因：接受TCP消息时，SERVER 断开连接
  static const String ACTIVATOR_FAILED_RECEIVE_MSG_TCP_SERVER_CLOSE_EXCEPTION =
      "3011";

  /// AP发送数据错误。原因：接受TCP消息时，处理data信息复制出错
  static const String ACTIVATOR_FAILED_RECEIVE_MSG_TCP_DATA_COPY_EXCEPTION =
      "3012";

  /// 重复配网。原因：UDP端口被占用
  static const String ACTIVATOR_FAILED_UDP_REPEAT_LISTEN = "3003";

  /// AP发送数据错误。原因：处理UDP消息回调，数据异常
  static const String ACTIVATOR_FAILED_UDP_DATA_COPY_CALLBACK_EXCEPTION =
      "3013";

  /// AP发送数据错误。原因：UDP接受广播发生未知IO EXCEPTION
  static const String ACTIVATOR_FAILED_UDP_UNKNOWN_IO_EXCEPTION = "3014";

  /// AP配网超时
  static const String ACTIVATOR_FAILED_AP_TIMEOUT = "3015";

  /**
   * MQTT 错误
   */

  /// 获取MQTT认证网络请求失败
  static const String MQTT_FAILED_HTTP_EXCEPTION = "6001";

  /// 请求到结果后，将key写入本地文件失败
  static const String MQTT_FAILED_WRITE_KEY = "6002";

  /// 异步获取CERT时，client为空
  static const String MQTT_FAILED_CLIENT_NULL_EXCEPTION = "6003";

  /// 订阅用户消息时失败
  static const String MQTT_FAILED_USER_MSG_EXCEPTION = "6005";

  /**
   * 服务端与网络错误（5xxx）
   */

  /// 非法的BindCode
  static const String ACTIVATOR_FAILED_BIND_CODE_ERROR = "5000";

  /// 未找到指定SSID的WIFI
  static const String ACTIVATOR_FAILED_SSID_NOT_FOUND = "4000";

  /// WIFI密码错误
  static const String ACTIVATOR_FAILED_SSID_PASSWORD_ERROR = "4001";

  /// WIFI连接失败
  static const String ACTIVATOR_FAILED_CONNECT_ROUTER = "4002";

  /// WIIF连接超时
  static const String ACTIVATOR_FAILED_SSID_CONNECT_TIMEOUT = "4003";

  /// 路由器无法分配IP
  static const String ACTIVATOR_FAILED_ROUTER_NO_IP = "4004";

  /// 连接路由器后，网络不通
  static const String ACTIVATOR_FAILED_SERVICE_ERROR = "4005";

  /// 扫地机时间同步错误
  static const String ACTIVATOR_FAILED_DEVICE_SYNC_FAIL = "4006";

  /// 扫地机注册失败
  static const String ACTIVATOR_FAILED_DEVICE_REGISTER_FAIL = "4007";

  /// 扫地机注册失败(UUID与Key不匹配)
  static const String ACTIVATOR_FAILED_DEVICE_ID_NOT_MATCH = "4008";
}
