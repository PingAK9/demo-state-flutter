import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class BlocCounterView extends StatefulWidget {
  @override
  _BlocCounterViewState createState() => _BlocCounterViewState();
}

class _BlocCounterViewState extends State<BlocCounterView> {
  CounterBloc _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Bloc')),
      body: BlocBuilder<CounterBloc, int>(
        bloc: _bloc,
        builder: (context, count) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Using Flutter Bloc Package to management state',
                textAlign: TextAlign.center,
              ),
              Text(
                '$count',
                style: Theme.of(context).textTheme.display1,
              )
            ],
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
                _bloc.add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                _bloc.add(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}
