import '../entities/iot_device.dart';
import 'activator_progress.dart';

/// 配网进度
typedef OnProgress = void Function(ActivatorProgress progress);

/// 配网成功
/// @param device
typedef OnSuccess = void Function(IotDevice device);

/// 配网失败
/// @param code 错误码
typedef OnFailure = void Function(String code);

class ActivatorCallback {
  OnProgress onProgress;
  OnSuccess onSuccess;
  OnFailure onFailure;

  ActivatorCallback(
      {required OnProgress this.onProgress,
      required OnSuccess this.onSuccess,
      required OnFailure this.onFailure});
}
