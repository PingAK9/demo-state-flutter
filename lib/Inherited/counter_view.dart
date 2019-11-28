import 'package:demo_bloc_flutter/Inherited/inherited_container.dart';
import 'package:flutter/material.dart';

class InheritedCounterView extends StatefulWidget {
  @override
  _InheritedCounterViewState createState() => _InheritedCounterViewState();
}

class _InheritedCounterViewState extends State<InheritedCounterView> {
  int value;

  @override
  Widget build(BuildContext context) {
    return StateContainer(
      child: Scaffold(
        appBar: AppBar(title: Text('Demo Inherited')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                "User InheritedWidget to management state",
                textAlign: TextAlign.center,
              ),
              TextCounter(),
            ],
          ),
        ),
        floatingActionButton: ButtonControl(),
      ),
    );
  }
}

class TextCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var value = StateContainer.of(context).value ?? 'null';
    return Text(
      '$value',
      style: Theme.of(context).textTheme.display1,
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
              StateContainer.of(context).increment();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              StateContainer.of(context).decrement();
            },
          ),
        ),
      ],
    );
  }
}
