

abstract class LeConfig {

  static const String serviceUuid = '0000fd25-0000-1000-8000-00805f9b34fb';
  static const String characterWriteUuid = '02000200-0000-1000-8000-009278563412';
  static const String characterReadUuid = '03000300-0000-1000-8000-009278563412';
  /// 描述uuid，一般都统一为这个
  static const String clientCharacteristicConfig = '00002902-0000-1000-8000-00805f9b34fb';


  /// 发送重试最多尝试次数
  static const int txRepeatMaxCount = 10;
  /// 尝试间隔时间，单位毫秒
  static const int txRepeatDelay = 100;


  /// 连接蓝牙重试最多尝试次数
  static const int retryRepeatMaxCount = 10;

  /// 连接蓝牙是否重试
  static const int flagRetry = 0x1;


  /// 蓝牙是否发现服务成功
  static const int flagDiscovered = 0x2;

  /// 蓝牙连接回调是否超时，尝试连接一次
  static const int flagConnectWithoutCallback = 0x4;

  /// 查询社保是否绑定成功间隔时间，单位毫秒
  static const int bindCheckDelay = 3000;

  /// 连接状态
  static const int flagConnected = 0x1;
  static const int flagDisconnect = 0x2;
  static const int flagConnectionFailed = 0x4;

  /// ble 配网状态
  static const int flagBleLog = 0x1;
  static const int flagDeviceRegisterSuccess = 0x2;
  static const int flagDeviceRegisterFailed = 0x4;
  static const int flagDataFinished = 0x8;

}