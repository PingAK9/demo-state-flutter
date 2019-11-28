import 'dart:async';

import 'package:demo_bloc_flutter/bloc_manually/counter_event.dart';


class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(event) {
    if (event is IncrementEvent) {
      _counter++;
    }
    if (event is DecrementEvent) {
      _counter--;
    }
    _inCounter.add(_counter);
  }
}
