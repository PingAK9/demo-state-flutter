import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'counter_model.dart';

class ScopedModelView extends StatefulWidget {
  @override
  _ScopedModelViewState createState() => _ScopedModelViewState();
}

class _ScopedModelViewState extends State<ScopedModelView> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Demo Scoped Model')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text("User Scoped model Package to management state", textAlign: TextAlign.center,),
              ScopedModelDescendant<CounterModel>(
                builder: (context, child, model) => new Text('${model.counter}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),
        floatingActionButton: ButtonControl(),
      ),
    );
  }
}

class ButtonControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              CounterModel.of(context).increment();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              CounterModel.of(context).decrement();
            },
          ),
        ),
      ],
    );
  }
}
