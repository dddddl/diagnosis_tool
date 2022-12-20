import 'package:diagnosis_tool/domain/observer.dart';
import 'package:diagnosis_tool/domain/presenter.dart';
import 'package:diagnosis_tool/domain/usecases/robot_list_usecase.dart';

class RobotListPresenter extends Presenter {
  Function? onNext;
  Function? onComplete;
  Function? onError;

  RobotListUseCase robotListUseCase;

  RobotListPresenter(robotRepo)
      : robotListUseCase = RobotListUseCase(robotRepo);

  void getAll() {
    robotListUseCase.execute(
        _RobotListUseCaseObserver(this), RobotListUseCaseParams());
  }

  @override
  void dispose() {
    robotListUseCase.dispose();
  }
}

class _RobotListUseCaseObserver extends Observer<RobotListUseCaseResponse> {
  final RobotListPresenter presenter;

  _RobotListUseCaseObserver(this.presenter);

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
    presenter.onNext?.call(response?.robots);
  }
}
