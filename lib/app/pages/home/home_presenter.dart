import 'package:diagnosis_tool/domain/observer.dart';
import 'package:diagnosis_tool/domain/presenter.dart';
import 'package:diagnosis_tool/domain/usecases/get_user_usecase.dart';

class HomePresenter extends Presenter {
  Function? getUserOnNext;
  Function? getUserOnComplete;
  Function? getUserOnError;

  GetUserUseCase getUserUseCase;

  HomePresenter(usersRepo) : getUserUseCase = GetUserUseCase(usersRepo);

  void getUser(String uid) {
    getUserUseCase.execute(
        _GetUserUseCaseObserver(this), GetUserUseCaseParams(uid));
  }

  @override
  void dispose() {
    getUserUseCase.dispose();
  }
}

class _GetUserUseCaseObserver extends Observer<GetUserUseCaseResponse> {
  final HomePresenter presenter;

  _GetUserUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    presenter.getUserOnComplete?.call();
  }

  @override
  void onError(e) {
    presenter.getUserOnError?.call(e);
  }

  @override
  void onNext(response) {
    presenter.getUserOnNext?.call(response!.user);
  }
}
