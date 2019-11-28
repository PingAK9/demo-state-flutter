import 'package:flutter/material.dart';

import 'Inherited/counter_view.dart';
import 'bloc/counter_view.dart';
import 'bloc_manually/counter_view.dart';
import 'provider/counter_view.dart';
import 'scoped_model/counter_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: InheritedCounterView(),
//      home: ScopedModelView(),
//      home: ProviderView(),
//      home: BlocCounterView(),
      home: BlocManuallyCounterView(),
    );
  }
}
