import 'dart:convert';

import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/data/mqtt/mqtt_client.dart';
import 'package:diagnosis_tool/domain/entities/mqtt_entity.dart';
import 'package:diagnosis_tool/domain/observer.dart';
import 'package:diagnosis_tool/domain/presenter.dart';
import 'package:diagnosis_tool/domain/usecases/mqtt_status_usecase.dart';
import 'package:diagnosis_tool/domain/usecases/robot_map_usecase.dart';
import 'package:diagnosis_tool/domain/usecases/robot_usecase.dart';
import 'package:diagnosis_tool/iot/things/const.dart';
import 'package:diagnosis_tool/iot/things/entities/command.dart';
import 'package:diagnosis_tool/iot/things/entities/control.dart';
import 'package:diagnosis_tool/iot/utils/short_uuid.dart';
import 'package:logger/logger.dart';

import '../../../domain/entities/robot_status_entity.dart';

class RobotPresenter extends Presenter {
  Function(dynamic next)? onNext;
  Function? onComplete;
  Function? onError;

  RobotUseCase robotUseCase;
  MqttStatusUseCase mqttStatusUseCase;
  SubscribeParams? topics;

  String? robotId;
  Logger logger;

  RobotPresenter(repository, this.logger)
      : robotUseCase = RobotUseCase(repository, logger),
        mqttStatusUseCase = MqttStatusUseCase(logger);

  void getRobot(String robotId) {
    robotUseCase.execute(
        _RobotUseCaseObserver(this), RobotUseCaseParams(robotId));
  }

  void getRobotState(String robotId) {
    this.robotId = robotId;
    mqttStatusUseCase.execute(_MqttStatusUseCaseObserver(this), null);
    robotUseCase.execute(
        _RobotUseCaseObserver(this), RobotUseCaseParams(robotId));
    _addSubscribeParams(robotId);
  }

  void charge() {
    sendMsg(CmdConfig.control, ControlConfig.returning);
  }

  void mower() {
    sendMsg(CmdConfig.control, ControlConfig.mowing);
  }

  void map() {
    sendMsg(CmdConfig.control, ControlConfig.mapping);
  }

  void pause() {
    sendMsg(CmdConfig.control, ControlConfig.paused);
  }

  void sendMsg(int cmd, int status) {
    Command command = Command<ControlParams>(
        cmd: cmd,
        uuid: ShortUuid.generateShortUuid(),
        timeStamps: DateTime.now().millisecondsSinceEpoch,
        params: ControlParams(status: status));

    final json = command.toJson((p0) => p0.toJson());

    MqttClient.instance.pubMsg(
        PublishParams('/thing/down/property/1/$robotId', jsonEncode(json)));
  }

  void _requestMap() {
    MqttEntity entity = MqttEntity(
        cmd: "map",
        subcmd: "upload",
        uuid: ShortUuid.generateShortUuid(),
        data: '');

    MqttClient.instance
        .pubMsg(PublishParams('/app/up/$robotId', jsonEncode(entity.toJson())));
  }

  Future<void> _addSubscribeParams(String topic) async {
    bool connect = await MqttClient.instance.connectWithPort();
    topics =
        SubscribeParams(['/app/down/$topic', '/thing/up/property/1/$topic']);
    if (connect) {
      MqttClient.instance.subscribeMsg(topics!);
      MqttClient.instance.listen(topics!);
      _requestMap();
    } else {
      logger.e('Mqtt client not connected');
    }
  }

  @override
  void dispose() {
    robotUseCase.dispose();
    mqttStatusUseCase.dispose();
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

class _MqttStatusUseCaseObserver extends Observer<MqttStatusUseCaseResponse> {
  final RobotPresenter presenter;

  _MqttStatusUseCaseObserver(this.presenter);

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
    presenter.onNext?.call(response!.state);
  }
}
