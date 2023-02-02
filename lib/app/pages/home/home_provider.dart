import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/app/pages/home/home_presenter.dart';
import 'package:diagnosis_tool/data/repositories/data_users_repository.dart';
import 'package:diagnosis_tool/domain/controller.dart';
import 'package:diagnosis_tool/domain/entities/user.dart';
import 'package:flutter/services.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/src/logger.dart';
import 'package:path_provider/path_provider.dart';

final homeProvider =
    StateNotifierProvider.autoDispose<HomeStateNotifier, HomeState>(
        (ref) => HomeStateNotifier(DataUsersRepository(), ref.read(logger)));

class HomeStateNotifier extends Controller<HomeState> {
  final HomePresenter presenter;
  final Logger logger;

  HomeStateNotifier(usersRepo, this.logger)
      : presenter = HomePresenter(usersRepo),
        super(HomeState());

  void getUser(String uid) {
    presenter.getUser('test-uid');
  }

  Future<ByteData> loadAsset() async {
    return await rootBundle.load('assets/mock/target.bin');
  }

  @override
  Future<void> init() async {
    ByteData data = await loadAsset();

    // Uint8List dataList = Uint8List.fromList(utf8.encode(data));
    Uint8List dataList = data.buffer.asUint8List();

    var bytes = GZipEncoder().encode(dataList);

    File logFiles =
        File('${(await getTemporaryDirectory()).path}/logs/target.gzip');
    logFiles = await logFiles.create(recursive: true);

    print(logFiles.path);
    if (bytes != null) {
      await logFiles.writeAsBytes(bytes);
    }

    presenter.getUserOnNext = (User user) {
      logger.i(user.toString());
    };

    presenter.getUserOnComplete = () {
      logger.i('User retrieved');
    };

    presenter.getUserOnError = (e) {
      logger.i('Could not retrieve user.');
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
