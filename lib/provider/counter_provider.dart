
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{

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
}