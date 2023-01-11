import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/data/mqtt/mqtt_client.dart';
import 'package:diagnosis_tool/domain/observer.dart';
import 'package:diagnosis_tool/domain/presenter.dart';
import 'package:diagnosis_tool/domain/usecases/robot_map_usecase.dart';
import 'package:diagnosis_tool/domain/usecases/robot_usecase.dart';
import 'package:diagnosis_tool/iot/things/entities/control.dart';

import '../../../domain/entities/robot_status_entity.dart';

class RobotPresenter extends Presenter {
  Function(dynamic next)? onNext;
  Function? onComplete;
  Function? onError;

  RobotUseCase robotUseCase;
  SubscribeParams? topics;

  String? robotId;

  RobotPresenter(repository, logger)
      : robotUseCase = RobotUseCase(repository, logger);

  void getRobot(String robotId) {
    robotUseCase.execute(
        _RobotUseCaseObserver(this), RobotUseCaseParams(robotId));
  }

  void getRobotState(String robotId) {
    this.robotId = robotId;
    _addSubscribeParams(robotId);
    robotUseCase.execute(
        _RobotUseCaseObserver(this), RobotUseCaseParams(robotId));
  }

  void charge() {
    Control control = Control(ControlParams(1, 0));
    print(control.toString());

    MqttClient.instance.pubMsg(
        PublishParams('/app/up/$robotId', control.toString()));
  }

  void mower() {
    MqttClient.instance.pubMsg(
        PublishParams('/app/up/$robotId', '11111111111111111111111111111'));
  }

  void map() {
    MqttClient.instance.pubMsg(
        PublishParams('/app/up/$robotId', '11111111111111111111111111111'));
  }

  void pause() {
    MqttClient.instance.pubMsg(
        PublishParams('/app/up/$robotId', '11111111111111111111111111111'));
  }

  Future<void> _addSubscribeParams(String topic) async {
    bool connect = await MqttClient.instance.connectWithPort();
    topics = SubscribeParams(['/app/down/$topic']);
    if (connect) {
      MqttClient.instance.subscribeMsg(topics!);
      MqttClient.instance.listen(topics!);
    }
  }

  @override
  void dispose() {
    robotUseCase.dispose();
    if (topics != null) {
      MqttClient.instance.unsubscribeMsg(topics!);
    }
  }
}

class _RobotUseCaseObserver extends Observer<RobotUseCaseResponse> {
  final RobotPresenter presenter;

  _RobotUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onComplete?.call();
  }

  @override
  void onError(e) {
    presenter.onError?.call(e);
  }

  @override
  void onNext(response) {
    presenter.onNext?.call(response!.robotState);
  }
}
