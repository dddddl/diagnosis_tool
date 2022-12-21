import 'package:diagnosis_tool/domain/observer.dart';
import 'package:diagnosis_tool/domain/presenter.dart';
import 'package:diagnosis_tool/domain/usecases/robot_usecase.dart';

class RobotPresenter extends Presenter {
  Function? onNext;
  Function? onComplete;
  Function? onError;

  RobotUseCase robotUseCase;

  RobotPresenter(repository, logger)
      : robotUseCase = RobotUseCase(repository, logger);

  void getRobot(String robotId) {
    robotUseCase.execute(
        _RobotUseCaseObserver(this), RobotUseCaseParams(robotId));
  }

  void getRobotState(String robotId) {
    robotUseCase.execute(
        _RobotUseCaseObserver(this), RobotUseCaseParams(robotId));
  }

  @override
  void dispose() {
    robotUseCase.dispose();
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
