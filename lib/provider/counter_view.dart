import 'package:demo_bloc_flutter/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderView extends StatefulWidget {
  @override
  _ProviderViewState createState() => _ProviderViewState();
}

class _ProviderViewState extends State<ProviderView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CounterProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text('Demo Provider')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                  "User Provider Package to management state"),
              Consumer<CounterProvider>(
                builder: (context, provider, child) => new Text(
                    '${provider.counter}',
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
              Provider.of<CounterProvider>(context).increment();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              Provider.of<CounterProvider>(context).decrement();
            },
          ),
        ),
      ],
    );
  }
}
