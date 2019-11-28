import 'package:flutter/material.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';

class BlocManuallyCounterView extends StatefulWidget {
  @override
  _BlocManuallyCounterViewState createState() => _BlocManuallyCounterViewState();
}

class _BlocManuallyCounterViewState extends State<BlocManuallyCounterView> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Bloc Manually')),
      body: StreamBuilder(
        stream: _bloc.counter,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Using StreamBuilder to create Bloc pattern manually',
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _bloc.counterEventSink.add(IncrementEvent());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                _bloc.counterEventSink.add(DecrementEvent());
              },
            ),
          ),
        ],
      ),
    );
  }
}
