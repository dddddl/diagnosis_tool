import 'dart:async';

import 'composite_subscription.dart';
import 'observer.dart';

abstract class UseCase<T, Params> {
  late CompositeSubscription _disposables;

  UseCase() {
    _disposables = CompositeSubscription();
  }

  /// Builds the [Stream] to be subscribed to. [Params] is required
  /// by the [UseCase] to retrieve the appropraite data from the repository
  Future<Stream<T?>> buildUseCaseStream(Params? params);

  /// Subscribes to the [Observerable] with the [Observer] callback functions.
  void execute(Observer<T> observer, [Params? params]) async {
    final StreamSubscription subscription = (await buildUseCaseStream(params))
        .listen(observer.onNext,
            onDone: observer.onComplete, onError: observer.onError);
    _addSubscription(subscription);
  }

  /// Disposes (unsubscribes) from the [Stream]
  void dispose() {
    if (!_disposables.isDisposed) {
      _disposables.dispose();
    }
  }

  /// Adds a [StreamSubscription] i.e. the subscription to the
  /// [Stream] to the [CompositeSubscription] list of subscriptions.
  void _addSubscription(StreamSubscription subscription) {
    if (_disposables.isDisposed) {
      _disposables = CompositeSubscription();
    }
    _disposables.add(subscription);
  }
}

/// A special type of [UseCase] that does not return any value.
/// This [UseCase] only performs a task and reports either success or failure.
/// A good candidate for such a [UseCase] would be logout or login.
/// ```dart
///     // A `UseCase` for logging out a `User`
///     class LogoutUseCase extends CompletableUseCase<void> {
///
///       AuthenticationRepository _authenticationRepository;///
///       LogoutUseCase(this._authenticationRepository);
///
///       @override
///       Future<Stream<User>> buildUseCaseStream(void ignore) async {
///         final StreamController<User> controller = StreamController();
///         try {
///           await _authenticationRepository.logout();
///           controller.close();
///         } catch (e) {
///           controller.addError(e);
///         }
///         return Stream(controller.stream);
///       }
///     }
///
/// ```
abstract class CompletableUseCase<Params> extends UseCase<void, Params?> {
  @override
  Future<Stream<void>> buildUseCaseStream(Params? params);
}
