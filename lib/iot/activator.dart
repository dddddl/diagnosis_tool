abstract class Activator {
  /// WIFI 开始配网
  void start();

  ///     * 取消设备入网
  ///      * 终止配网，如果设备已经在进行云端注册激活或者已经完成UDP消息传递，取消入网不会有任何影响，仍可能会配网成功。
  void stop();

}
