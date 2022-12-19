import 'dart:async';



/// Acts as a container for multiple subscriptions that can be canceled at once
/// e.g. view subscriptions in Flutter that need to be canceled on view disposal
///
/// Can be cleared or disposed. When disposed, cannot be used again.
/// ### Example
/// // init your subscriptions
/// composite.add(stream1.listen(listener1))
/// ..add(stream2.listen(listener1))
/// ..add(stream3.listen(listener1));
///
/// // clear them all at once
/// composite.clear();
class CompositeSubscriptionMap<K> {
  bool _isDisposed = false;

  final Map<K, StreamSubscription<dynamic>> _subscriptionsMap = {};

  /// Checks if this composite is disposed. If it is, the composite can't be used again
  /// and will throw an error if you try to add more subscriptions to it.
  bool get isDisposed => _isDisposed;

  /// Returns the total amount of currently added [StreamSubscription]s
  int get length => _subscriptionsMap.length;

  /// Checks if there currently are no [StreamSubscription]s added
  bool get isEmpty => _subscriptionsMap.isEmpty;

  /// Checks if there currently are [StreamSubscription]s added
  bool get isNotEmpty => _subscriptionsMap.isNotEmpty;

  /// Whether all managed [StreamSubscription]s are currently paused.
  bool get allPaused => _subscriptionsMap.isNotEmpty
      ? _subscriptionsMap.values.every((it) => it.isPaused)
      : false;

  /// Adds new subscription to this composite.
  ///
  /// Throws an exception if this composite was disposed
  StreamSubscription<T> add<T>(K k, StreamSubscription<T> subscription) {
    if (isDisposed) {
      throw ('This composite was disposed, try to use new instance instead');
    }
    _subscriptionsMap[k] = subscription;
    logger.i(  'add Key $k');
    logger.i(  'subscription $subscription');
    return subscription;
  }

  /// Cancels subscription and removes it from this composite.
  void remove(K k) {
    logger.i(  'remove Key $k');
    logger.i(  '_subscriptionsMap[k]' + _subscriptionsMap[k].toString());
    _subscriptionsMap[k]?.cancel();
    _subscriptionsMap.remove(k);
  }

  /// Cancels all subscriptions added to this composite. Clears subscriptions collection.
  ///
  /// This composite can be reused after calling this method.
  void clear() {
    _subscriptionsMap.values.forEach((it) => it.cancel());
    _subscriptionsMap.clear();
  }

  /// Cancels all subscriptions added to this composite. Disposes this.
  ///
  /// This composite can't be reused after calling this method.
  void dispose() {
    clear();
    _isDisposed = true;
  }

  /// Pauses all subscriptions added to this composite.
  void pauseAll([Future<void>? resumeSignal]) =>
      _subscriptionsMap.values.forEach((it) => it.pause(resumeSignal));

  /// Resumes all subscriptions added to this composite.
  void resumeAll() => _subscriptionsMap.values.forEach((it) => it.resume());
}
