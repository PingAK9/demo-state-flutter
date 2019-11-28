
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model{
  int _counter = 0;

  int get counter => _counter;

  set counter(int counter) {
    _counter = counter;
  }
  void increment() {
    // First, increment the counter
    _counter++;

    // Then notify all the listeners.
    notifyListeners();
  }
  void decrement(){
    _counter--;
    notifyListeners();
  }
  /// Wraps [ScopedModel.of] for this [Model].
  static CounterModel of(BuildContext context) =>
      ScopedModel.of<CounterModel>(context);
}