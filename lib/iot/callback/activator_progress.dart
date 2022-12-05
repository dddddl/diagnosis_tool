enum ActivatorProgress {


  /// 连接设备（包括传输配网资料）
  TRANSPORTING,

  /// 设备联网
  /// 设备连接路由器
  CONNECTING,

  /// 设备注册，账号绑定
  REGISTERING,

  /// 设备激活
  ACTIVATING,

  /// 设备激活成功
  ACTIVATED,
}
