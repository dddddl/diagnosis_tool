enum MachineState {
  // 机器锁定
  locked,
  // 待机
  standby,
  // 建图
  mapping,
  // 割草
  mowing,
  // 返回
  returning,
  // 暂停
  paused,
  // 定位
  positioning,
  // 睡眠
  sleep,
  // 异常
  exception,
  // 关机
  shutdown,
  // 未知 defalut
  other,
}
