

import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int>{
  @override
  // TODO: implement initialState
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    // TODO: implement mapEventToState
    switch(event){
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
      default:
        yield state + 1;
        break;
    }
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
  }
}

enum CounterEvent { increment, decrement }