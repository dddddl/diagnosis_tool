import 'package:diagnosis_tool/app/pages/home/home_presenter.dart';
import 'package:diagnosis_tool/data/repositories/data_users_repository.dart';
import 'package:diagnosis_tool/domain/controller.dart';
import 'package:diagnosis_tool/domain/entities/user.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeProvider = StateNotifierProvider.autoDispose<HomeStateNotifier, HomeState>(
    (ref) => HomeStateNotifier(DataUsersRepository()));

class HomeStateNotifier extends Controller<HomeState> {
  final HomePresenter presenter;

  HomeStateNotifier(usersRepo)
      : presenter = HomePresenter(usersRepo),
        super(HomeState());

  void getUser(String uid) {
    presenter.getUser('test-uid');
  }

  @override
  void init() {
    presenter.getUserOnNext = (User user) {
      logger.i(  user.toString());
    };

    presenter.getUserOnComplete = () {
      logger.i(  'User retrieved');
    };

    presenter.getUserOnError = (e) {
      logger.i(  'Could not retrieve user.');
    };
  }

  @override
  void dispose() {
    super.dispose();
    presenter.dispose();
  }
}

class HomeState {
  HomeState();
}
