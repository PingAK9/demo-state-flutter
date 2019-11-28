



import 'package:flutter/material.dart';

class InheritedCounter extends InheritedWidget {
  InheritedCounter({@required this.value, @required child})
      : assert(value != null),
        assert(child != null),
        super(child: child);
  final StateContainerState value;

  @override
  bool updateShouldNotify(InheritedCounter oldWidget) => true;
}

class StateContainer extends StatefulWidget {
  StateContainer({@required this.child});

  final Widget child;

  @override
  StateContainerState createState() => StateContainerState();

  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InheritedCounter)
    as InheritedCounter)
        .value;
  }
}

class StateContainerState extends State<StateContainer> {
  var value = 0;

  void increment() {
    setState(() {
      value++;
    });
  }

  void decrement() {
    setState(() {
      value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
      value: this,
      child: widget.child,
    );
  }
}
