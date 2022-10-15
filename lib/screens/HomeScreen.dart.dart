// screen_a.dart
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        Text(
          'dsds',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    ));
  }
}
