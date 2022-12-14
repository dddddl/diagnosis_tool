import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class Controller<T> extends StateNotifier<T> {

  @mustCallSuper
  Controller(super.state){
    init();
  }

  @protected
  void init();
}
